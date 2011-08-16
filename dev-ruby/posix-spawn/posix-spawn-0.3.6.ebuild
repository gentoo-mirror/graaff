# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_EXTRADOC="README.md TODO"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="none"

inherit multilib ruby-fakegem

DESCRIPTION="The posix-spawn library aims to implement a subset of the Ruby 1.9 Process::spawn"
HOMEPAGE="https://github.com/rtomayko/posix-spawn/"
LICENSE="MIT LGPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake -Cext
	cp ext/*$(get_modname) lib/ || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb test || die
}
