# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Viking is a free/open source program to manage GPS data."
HOMEPAGE="http://viking.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE="expedia google openstreetmap realtime-gps terraserver"
KEYWORDS="~amd64"

RDEPEND=">=x11-libs/gtk+-2.2.0
	net-misc/curl
	realtime-gps? ( sci-geosciences/gpsd )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig"

# Parallel build is broken as all make rules for icons use the same temp file.
MAKEOPTS="${MAKEOPTS} -j1"

src_compile() {
	econf \
		$(use_enable openstreetmap) \
		$(use_enable expedia) \
		$(use_enable terraserver) \
		$(use_enable google) \
		$(use_enable realtime-gps realtime-gps-tracking) \
		|| die "configure failed"

	emake || die "emake failed"
}

src_install() {
	einstall || die "Install failed"
	dodoc README doc/GEOCODED-PHOTOS doc/GETTING-STARTED doc/GPSMAPPER \
		|| die "Unable to install docs"
}
