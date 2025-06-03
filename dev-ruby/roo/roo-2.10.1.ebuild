# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="roo.gemspec"

inherit ruby-fakegem

DESCRIPTION="Access the contents of various spreadsheet files."
HOMEPAGE="https://github.com/roo-rb/roo"
SRC_URI="https://github.com/roo-rb/roo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/nokogiri-1
	dev-ruby/rubyzip:2
"

ruby_add_bdepend "test? ( dev-ruby/rspec:3 dev-ruby/shoulda dev-ruby/rack:2.2 )"

all_ruby_prepare() {
	sed -i -e '/coveralls/I s:^:#:' Rakefile || die
	sed -i -e '/reporters/ s:^:#:' test/test_helper.rb || die
	sed -e '/simplecov/ s:^:#:' \
		-e '2igem "rack", "<3"' \
		-i test/test_helper.rb spec/spec_helper.rb || die

	# Avoid tests that require network access
	sed -e '/\(download_uri_with_query_string\|with_invalid_host\)/a skip "network access required"' \
		-i test/roo/test_{open_office,excelx}.rb || die
}
