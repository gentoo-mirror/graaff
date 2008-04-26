# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="Soylent"
HOMEPAGE="http://treitter.livejournal.com/tag/soylent"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://www.netdrain.com/soylent/${P}.tar.gz"

RDEPEND="
	>=x11-libs/gtk+-2.0
	>=gnome-base/libglade-2.0
	>=gnome-base/libgnome-2.0
	>=gnome-base/libgnomeui-2.0
	>=net-im/empathy-0.22.0
	net-im/telepathy-mission-control
	gnome-extra/evolution-data-server
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0
"

