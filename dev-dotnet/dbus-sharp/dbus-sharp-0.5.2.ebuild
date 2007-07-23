# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mono multilib

GLIB_PV="0.3"
GLIB_PN="${PN}-glib"
GLIB_P="${GLIB_PN}-${GLIB_PV}"
GLIB_S="${WORKDIR}/${GLIB_P}"

DESCRIPTION="C# implementation of D-Bus"
HOMEPAGE="http://www.ndesk.org/DBusSharp"
SRC_URI="http://www.ndesk.org/archive/dbus-sharp/${P}.tar.gz
	glib? ( http://www.ndesk.org/archive/dbus-sharp/${GLIB_P}.tar.gz )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="glib"

DEPEND=">=dev-lang/mono-1.1"
RDEPEND="${DEPEND}
	sys-apps/dbus
	glib? ( >=dev-libs/glib-2.0 )"

src_compile() {
	emake || die "emake failed"

	if use glib; then
		cd ${GLIB_S}
		emake DBUS_SHARP_PREFIX=${S} || die "emake ${GLIB_PN} failed"
	fi
}

src_install() {
	GACUTIL=/usr/bin/gacutil
	GACDIR="${D}"/usr/lib

	${GACUTIL} /i src/NDesk.DBus.dll /package dbus-sharp /f /gacdir ${GACDIR} || die
	if use glib; then
		${GACUTIL} /i ${GLIB_S}/glib/NDesk.DBus.GLib.dll /package dbus-sharp /f /gacdir ${GACDIR} || die
	fi

	dodoc README

	if use glib; then
		cd ${GLIB_S}
		newdoc README README.Glib
	fi

	insinto /usr/lib/pkgconfig
	doins ${FILESDIR}/ndesk-dbus-1.0.pc
	if use glib; then
		doins ${FILESDIR}/ndesk-dbus-glib-1.0.pc
	fi
}
