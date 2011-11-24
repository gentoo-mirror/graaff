# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="ChangeLog readme.sj readme.txt"

RUBY_FAKEGEM_EXTRAINSTALL="data"

inherit multilib ruby-fakegem

DESCRIPTION="Rjb is Ruby-Java bridge using Java Native Interface."
HOMEPAGE="http://rjb.rubyforge.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

DEPEND="${DEPEND} virtual/jdk"
RDEPEND="${RDEPEND} virtual/jdk"

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake -Cext
	cp ext/rjbcore$(get_modname) lib/ || die
}

each_ruby_test() {
	${RUBY} -Ctest -I../lib test.rb || die
}
