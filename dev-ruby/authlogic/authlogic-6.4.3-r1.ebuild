# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="https://github.com/binarylogic/authlogic"
SRC_URI="https://github.com/binarylogic/authlogic/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Ruby"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/activerecord-5.2:*   <dev-ruby/activerecord-7.2:*
	>=dev-ruby/activesupport-5.2:*  <dev-ruby/activesupport-7.2:*
	>=dev-ruby/request_store-1.0.5:*
"

ruby_add_bdepend "test? ( dev-ruby/scrypt:0 dev-ruby/sqlite3 dev-ruby/timecop )"

all_ruby_prepare() {
	sed -i -e '/\(bundler\|coverall\|rubocop\)/I s:^:#:' Rakefile || die
	sed -e '/byebug/ s:^:#: ; /reporters/I s:^:#:' \
		-e '/coveralls/,/SimpleCov.start/ s:^:#:' \
		-e '2igem "activerecord", "< 7.2"; gem "railties", "< 7.2"' \
		-i test/test_helper.rb || die

	# https://github.com/binarylogic/authlogic/issues/766
	sed -e 's/MiniTest/Minitest/g' \
		-i lib/authlogic/test_case.rb || die
}
