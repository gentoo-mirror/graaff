# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

# Recent releases are not tagged in git.
COMMIT=2e952ff2088082c9f00c95e3c1261afc826f737c

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md README_FROM_VERSION_3_TO_4.md"
RUBY_FAKEGEM_GEMSPEC="aasm.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A library for adding finite state machines to Ruby classes."
HOMEPAGE="https://github.com/aasm/aasm"
SRC_URI="https://github.com/aasm/aasm/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="aasm-${COMMIT}"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

PATCHES=( "${FILESDIR}/${P}-rails71.patch" )

ruby_add_rdepend "dev-ruby/concurrent-ruby:1"

ruby_add_bdepend "test? (
	|| ( dev-ruby/activerecord:7.2 dev-ruby/activerecord:7.1 dev-ruby/activerecord:7.0 )
	dev-ruby/rr
)"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -e '/coveralls/I s:^:#:' \
		-e '/simplecov/,/^end/ s:^:#:' \
		-e '/pry/ s:^:#:' \
		-i spec/spec_helper.rb || die

	sed -i -e 's/git ls-files --/find/' ${RUBY_FAKEGEM_GEMSPEC} || die

	# We currently don't package sdoc
	sed -i -e '/sdoc/d' Rakefile || die

	# Avoid spec that requires unpackaged generator_spec
	rm -f spec/generators/{active_record,mongoid}_generator_spec.rb || die

	# Avoid spec that depends on unpackaged after_commit_everywhere
	sed -e '/it.*after_commit/ s/it/xit/' \
		-i spec/unit/persistence/active_record_persistence_spec.rb || die
}
