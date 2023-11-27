# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="phlex.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="sus"

inherit ruby-fakegem

DESCRIPTION="A framework for building object-oriented views in Ruby"
HOMEPAGE="https://github.com/phlex-ruby/phlex"
SRC_URI="https://github.com/phlex-ruby/phlex/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

# Has issues with sus invocation.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/concurrent-ruby-1.2:1
	>=dev-ruby/erb-4
	>=dev-ruby/zeitwerk-2.6:2
"

all_ruby_prepare() {
	sed -e 's:_relative ": "./:' \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
