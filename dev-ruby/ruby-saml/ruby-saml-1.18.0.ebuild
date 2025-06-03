# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A library for implementing the client side of a SAML authorization"
HOMEPAGE="https://github.com/saml-toolkits/ruby-saml"
SRC_URI="https://github.com/saml-toolkits/ruby-saml/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.13.10 dev-ruby/rexml"

ruby_add_bdepend "test? ( dev-ruby/timecop dev-ruby/mocha dev-ruby/shoulda )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/d' \
		-e '/bundler/I s:^:#:' \
		-e '/mocha/ s/setup/minitest/' \
		-e '/\(simplecov\|coveralls\)/ s:^:#:' \
		-e '/SimpleCov/,/^end/ s:^:#:' test/test_helper.rb || die

	sed -ie -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '3irequire "onelogin/ruby-saml/http_error"' test/idp_metadata_parser_test.rb || die
}
