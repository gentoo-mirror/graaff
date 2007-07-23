# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="Share files easily with others"
HOMEPAGE="http://code.google.com/p/giver/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="http://giver.googlecode.com/files/${P}.tar.gz"

# Tests are broken due to intltool tests
RESTRICT="test"

DEPEND="dev-util/pkgconfig
	dev-lang/mono
	gnome-base/gconf
	dev-dotnet/gtk-sharp
	dev-dotnet/gnome-sharp
	dev-dotnet/notify-sharp"

pkg_setup () {
	if ! built_with_use net-dns/avahi mono ; then
		eerror "giver needs the mono bindings from avahi, please rebuild avahi with the"
		eerror "mono USE flag."
		die "giver needs the mono USE flag for net-dns/avahi"
	fi
}

