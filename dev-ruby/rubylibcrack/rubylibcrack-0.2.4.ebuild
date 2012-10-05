# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19"

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

ruby_add_rdepend "virtual/ruby-ffi"

each_ruby_test() {
	${RUBY} -I. test/test_rubylibcrack.rb
}
