# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="A Ruby binding to the password strength checker, libcrack/cracklib."
HOMEPAGE="http://rubyforge.org/projects/rubylibcrack/"
LICENSE="GPL-3"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend test virtual/ruby-test-unit
ruby_add_rdepend "virtual/ruby-ffi"

each_ruby_test() {
	${RUBY} test/test_rubylibcrack.rb
}
