# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="A password manager for GNOME 2"
HOMEPAGE="http://oss.codepoet.no/revelation/"
SRC_URI="ftp://oss.codepoet.no/revelation/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""

DEPEND="dev-python/gnome-python-extras
	>=dev-python/pycrypto-1.9
	sys-libs/cracklib"

USE_DESTDIR="1"
DOCS="README AUTHORS ChangeLog TODO NEWS"
G2CONF="--disable-mime-update --disable-desktop-update"
