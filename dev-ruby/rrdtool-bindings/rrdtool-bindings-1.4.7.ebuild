# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/rrdtool/rrdtool-1.4.7.ebuild,v 1.2 2012/06/09 13:30:11 maksbotan Exp $

EAPI="4"

USE_RUBY="ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

MY_P=${P/-bindings}

DESCRIPTION="Ruby bindings for rrdtool."
HOMEPAGE="http://oss.oetiker.ch/rrdtool/"
SRC_URI="http://oss.oetiker.ch/rrdtool/pub/${MY_P}.tar.gz"
RUBY_S=$MY_P

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos ~x86-solaris"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cbindings/ruby extconf.rb || die
}

each_ruby_compile() {
	emake -Cbindings/ruby
}

each_ruby_test() {
	${RUBY} -Ibindings/ruby -Cbindings/ruby test.rb || die
}

each_ruby_install() {
	DESTDIR=${D} emake -Cbindings/ruby install
}
