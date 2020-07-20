# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Access the contents of various spreadsheet files."
HOMEPAGE="https://github.com/roo-rb/roo"
SRC_URI="https://github.com/roo-rb/roo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/nokogiri-1
	>=dev-ruby/rubyzip-1.2.1:1
"

ruby_add_bdepend "test? ( dev-ruby/rspec:3 dev-ruby/shoulda )"

all_ruby_prepare() {
	sed -i -e '/coveralls/I s:^:#:' Rakefile || die
	sed -i -e '/reporters/ s:^:#:' test/test_helper.rb || die
	sed -i -e '/simplecov/ s:^:#:' test/test_helper.rb spec/spec_helper.rb || die

	# Avoid tests that require network access
	sed -i -e '/\(download_uri_with_query_string\|with_invalid_host\)/a skip "network access required"' test/roo/test_{open_office,excelx}.rb || die
}
