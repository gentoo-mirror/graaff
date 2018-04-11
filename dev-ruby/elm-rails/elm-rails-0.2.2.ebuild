# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="View helpers for incorporating Elm modules into Rails views"
HOMEPAGE="https://github.com/fbonetti/elm-rails"
SRC_URI="https://github.com/fbonetti/elm-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Requires work on the test rails environments and refers to unpackaged dependencies.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/elm-compiler-0.3.0:0.3
	>=dev-ruby/rails-4.0:*
"

ruby_add_bdepend "
	test? ( dev-ruby/bundler )
"

all_ruby_prepare() {
	rm -f Gemfile.lock test/*/Gemfile.lock || die
	sed -i -e '/elm-compiler/ s/0.1.2/0.3.0/' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	${RUBY} -S bundle exec rake test || die
}
