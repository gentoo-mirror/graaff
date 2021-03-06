# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A library for implementing the client side of a SAML authorization"
HOMEPAGE="https://github.com/onelogin/ruby-saml"
SRC_URI="https://github.com/onelogin/ruby-saml/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.12"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.10.5 dev-ruby/rexml"

ruby_add_bdepend "test? ( dev-ruby/timecop dev-ruby/mocha dev-ruby/shoulda )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/d' \
		-e '/bundler/I s:^:#:' \
		-e '/\(simplecov\|coveralls\)/ s:^:#:' \
		-e '/SimpleCov/,/^end/ s:^:#:' test/test_helper.rb || die

	sed -ie -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '3irequire "onelogin/ruby-saml/http_error"' test/idp_metadata_parser_test.rb || die
}
