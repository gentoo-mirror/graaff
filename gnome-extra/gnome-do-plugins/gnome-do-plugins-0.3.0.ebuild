# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

MY_PN="do-plugins"

DESCRIPTION="Plugins to put the Do in Gnome Do"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="https://launchpad.net/gc/trunk/0.3.2.1/+download/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=gnome-extra/gnome-do-${PV}
		dev-dotnet/evolution-sharp"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"
