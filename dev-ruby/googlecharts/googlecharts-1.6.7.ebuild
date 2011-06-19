# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="History.txt README.markdown"
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="The goal of this Gem is to make the creation of Google Charts a simple and easy task."
HOMEPAGE="http://googlecharts.rubyforge.org/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

each_ruby_test() {
	${RUBY} -e "require 'openssl'; OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE" -S rspec spec || die
}
