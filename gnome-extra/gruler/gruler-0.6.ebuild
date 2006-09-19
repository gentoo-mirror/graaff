# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="A screen ruler for GNOME"
HOMEPAGE="http://linuxadvocate.org/projects/gruler/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="http://linuxadvocate.org/projects/gruler/downloads/${P}.tar.gz"

RDEPEND=">=dev-libs/atk-1.5
	>=x11-libs/gtk+-2.6
	>=dev-libs/glib-2
	>=gnome-base/libgnome-2
	>=gnome-base/libgnomeui-2
	>=gnome-base/gconf-1.1.9"

DEPEND="${RDEPEND}
	gnome-base/gnome-common
	sys-devel/flex
	>=dev-util/intltool-0.28
	app-text/scrollkeeper
	>=dev-util/pkgconfig-0.9"

DOCS="AUTHORS ChangeLog* COPYING NEWS README TODO"

src_unpack() {
	gnome2_src_unpack

	# Note that this should patch the Makefile.am and regenerate the associated
	# files, but the build process seems a bit messed up and even running
	# gnome-autogen.sh doesn't help to fix this. Instead of diving into this
	# (which should be done should this ebuild land in portage) I'm taking the
	# short way home here. Hopefully a new upstream version is available
	# shortly which fixes this.
	einfo "Patching Makefile to include proper linking procedure for libglade"
	sed -i -e "s/gruler_LDFLAGS =/gruler_LDFLAGS = -Wl,--export-dynamic/" "${S}"/src/Makefile.in

	einfo "Patching .desktop file"
	echo "Categories=Application;Utility" >> "${S}"/gruler.desktop.in
}

