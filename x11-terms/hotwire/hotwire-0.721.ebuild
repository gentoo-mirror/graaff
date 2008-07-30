# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

DESCRIPTION="An intelligent hybrid text/graphical shell for developers and system administrators"
HOMEPAGE="http://hotwire-shell.org/"
SRC_URI="http://hotwire-shell.googlecode.com/files/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome"

DEPEND=">=dev-lang/python-2.5"
RDEPEND="${DEPEND}
	x11-libs/vte
	dev-python/dbus-python
	dev-python/pygtksourceview
	dev-python/gnome-python-desktop"

pkg_config() {
	# if ! built_with_use '>=dev-lang/python-2.5' sqlite3 ; then
	if ! built_with_use '>=virtual/python-2.5' sqlite ; then
		die "You need to rebuild python with sqlite support"
	fi
	if ! built_with_use 'x11-libs/vte' python ; then
		die "You need to rebuild x11-libs/vte with python support"
	fi
}

src_install() {
	distutils_src_install

	domenu hotwire.desktop
	doicon images/hotwire.png
}
