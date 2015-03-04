# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils

DESCRIPTION="Precision Time Protocol daemon"
HOMEPAGE="http://ptpd.sf.net"

SRC_URI="mirror://sourceforge/ptpd/${PV}/${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="BSD"
SLOT="0"
IUSE="+snmp statistics debug +daemon"

# Bundles dev-libs/iniparser
COMMON_DEPEND=" snmp? ( net-analyzer/net-snmp )
				net-libs/libpcap"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"

DOCS="ChangeLog README doc/*"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable snmp) \
		$(use_enable statistics) \
		$(use_enable ntp ntpdc) \
		$(use_enable debug runtime-debug) \
		$(use_enable daemon)
}

src_install() {
	emake install DESTDIR="${D}" || die "install failed"

	insinto /etc
	doins "${FILESDIR}"/ptpd.conf

	newinitd "${FILESDIR}"/ptpd.rc ptpd
	newconfd "${FILESDIR}"/ptpd.confd ptpd
}

pkg_postinst() {
	ewarn "Review /etc/ptpd.conf to setup server info."
	ewarn "Review /etc/conf.d/ptpd to setup init.d info."
}
