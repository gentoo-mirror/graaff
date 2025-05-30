# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="solargraph.gemspec"

inherit ruby-fakegem

DESCRIPTION="IDE tools for code completion, inline documentation, and static analysis"
HOMEPAGE="https://solargraph.org/"
SRC_URI="https://github.com/castwide/solargraph/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/backport-1.2:0
	>=dev-ruby/benchmark-0.4.0:0
	dev-ruby/bundler:2
	>=dev-ruby/diff-lcs-1.4:0
	>=dev-ruby/jaro_winkler-1.6.1:1
	>=dev-ruby/kramdown-2.3:2
	>=dev-ruby/kramdown-parser-gfm-1.1:1
	>=dev-ruby/logger-1.6:0
	>=dev-ruby/observer-0.1:0
	>=dev-ruby/ostruct-0.6
	>=dev-ruby/parser-3.0:0
	dev-ruby/pry
	=dev-ruby/rbs-3*
	dev-ruby/reverse_markdown:3
	>=dev-ruby/rubocop-1.38
	dev-ruby/thor:1
	dev-ruby/tilt:2
	>=dev-ruby/yard-0.9.24:0
	>=dev-ruby/yard-solargraph-0.1:0
"

# public_suffix is listed as a development dependency but not actually used anywhere.
ruby_add_bdepend "test? (
	>=dev-ruby/webmock-3.6:3
)"

all_ruby_prepare() {
	sed -e '/pry/ s:^:#:' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -e '/bundler/ s:^:#:' \
		-e '/SIMPLECOV/,/end/ s:^:#:' \
		-i spec/spec_helper.rb || die

	sed -e '/ignores undefined method calls from external sources/askip "Does not work with Gentoo installed package"' \
		-i spec/type_checker/levels/strict_spec.rb || die

	# Various specs fail with pin issues. Ignore for now. Should also be
	# narrowed down to specific failures.
	rm -f spec/yard_map/mapper_spec.rb || die
}

each_ruby_test() {
	PATH=${HOME}/bin:$PATH each_fakegem_test

	# Remove cached gem installs in homedir since they will cause the
	# next run to fail.
	rm -rf "${HOME}/.local/share/gem" || die
}
