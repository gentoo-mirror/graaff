# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A library for implementing the client side of a SAML authorization"
HOMEPAGE="https://github.com/onelogin/ruby-saml"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend "
	>=dev-ruby/nokogiri-1.5.0
	>=dev-ruby/uuid-2.3:0"

ruby_add_bdepend "test? ( dev-ruby/timecop )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/d' test/test_helper.rb || die

	# Remove canonix since that already got removed from the code.
	sed -ie -e '/canonix/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Fix nokogiri dependency.
	sed -i -e 's/1.5.0/1.5/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
