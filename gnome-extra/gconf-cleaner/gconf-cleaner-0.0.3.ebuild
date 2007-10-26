# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A cleaning tool for GConf"
HOMEPAGE="http://code.google.com/p/gconf-cleaner/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://gconf-cleaner.googlecode.com/files/${P}.tar.gz"

# Tests currently fail due to intltool checks, we'll clean this up later.
RESTRICT="test"

DEPEND="
	>=dev-libs/glib-2.0
	>=x11-libs/gtk+-2.6
	>=gnome-base/gconf-2.0
"

src_install() {
	DESTDIR="${D}" emake install || die "Unable to install"

	dodoc README ChangeLog
}
