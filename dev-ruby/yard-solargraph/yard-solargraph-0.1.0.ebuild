# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="yard-solargraph.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A YARD extension for documenting Solargraph tags."
HOMEPAGE="https://solargraph.org/"
SRC_URI="https://github.com/castwide/yard-solargraph/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/yard-0.9:0"

all_ruby_prepare() {
	sed -e "s:_relative ': './:" \
		-e 's/__FILE__/"yard-solargraph.gemspec"/' \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -e '/simplecov/I s:^:#:' \
		-i spec/spec_helper.rb || die
}
