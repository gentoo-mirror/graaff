# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="ChangeLog README"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for the GTK+ port of WebKit."
HOMEPAGE="https://github.com/danlucraft/rbwebkitgtk"
SRC_URI="https://github.com/danlucraft/rbwebkitgtk/tarball/2c2f00d60459a67c6cf6468d9e4366908b1b0558 -> ${P}-git.tgz"
RUBY_S="danlucraft-rbwebkitgtk-*"

LICENSE="LGPL-2.1"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND+="net-libs/webkit-gtk:2"

ruby_add_bdepend "dev-ruby/ruby-glib2"

ruby_add_rdepend "dev-ruby/ruby-gtk2"

all_ruby_prepare() {
	sed -i -e '/have_library/ s/webkit/webkitgtk/' extconf.rb || die
}

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	emake
}

all_ruby_install() {
	all_fakegem_install

	dodoc -r sample
}

each_ruby_install() {
	DESTDIR=${D} emake install
}
