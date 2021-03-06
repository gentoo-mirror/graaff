# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="https://github.com/binarylogic/authlogic"
SRC_URI="https://github.com/binarylogic/authlogic/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activerecord-5.2:*   <dev-ruby/activerecord-6.2:*
	>=dev-ruby/activesupport-5.2:*  <dev-ruby/activesupport-6.2:*
	>=dev-ruby/request_store-1.0.5:*
"

ruby_add_bdepend "test? ( dev-ruby/scrypt:0 dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/\(bundler\|coverall\|rubocop\)/I s:^:#:' Rakefile || die
	sed -i -e '/byebug/ s:^:#: ; /reporters/I s:^:#:' \
		-e '/coveralls/,/SimpleCov.start/ s:^:#:' test/test_helper.rb || die
}
