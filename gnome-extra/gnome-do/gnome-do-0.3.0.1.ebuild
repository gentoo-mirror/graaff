# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="GNOME Do"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="http://do.davebsd.com/src/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Wonderful inconsistency...
S="${WORKDIR}/do-0.3"

# Restrict tests due to failing intltool tests, these should really be
# fixed upstream.
RESTRICT="test"

DEPEND="
	>=dev-util/intltool-0.35
	dev-util/pkgconfig
	>=dev-dotnet/gtk-sharp-2.0
	>=dev-dotnet/gnome-sharp-2.0
	>=dev-dotnet/gconf-sharp-2.0
	>=dev-dotnet/glade-sharp-2.0
	>=dev-dotnet/gnomevfs-sharp-2.0
	dev-dotnet/dbus-sharp
	dev-dotnet/dbus-glib-sharp
"
