# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A library for implementing the client side of a SAML authorization"
HOMEPAGE="https://github.com/onelogin/ruby-saml"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.8"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.10"

ruby_add_bdepend "test? ( dev-ruby/timecop dev-ruby/mocha dev-ruby/shoulda:0 )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/d' \
		-e '/bundler/I s:^:#:' \
		-e '/simplecov/ s:^:#:' \
		-e '/SimpleCov/,/end/ s:^:#:' test/test_helper.rb || die

	sed -ie -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '2i gem "shoulda", "~> 2.11"' test/test_helper.rb || die

	sed -i -e '3irequire "onelogin/ruby-saml/http_error"' test/idp_metadata_parser_test.rb || die
}
