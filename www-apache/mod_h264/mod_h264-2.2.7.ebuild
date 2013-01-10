# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_xsendfile/mod_xsendfile-1.0_beta1.ebuild,v 1.2 2012/09/08 18:34:18 qnikst Exp $

EAPI="4"

inherit apache-module

DESCRIPTION="Apache2 module that processes X-SENDFILE headers registered by the original output handler"
HOMEPAGE="http://h264.code-shop.com/"
SRC_URI="http://h264.code-shop.com/download/apache_${PN}_streaming-${PV}.tar.gz"

LICENSE="H264-Streaming-Module-License.pdf"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86 ~amd64-linux"
IUSE=""

S=${WORKDIR}/${PN}_streaming-${PV}

RDEPEND="${DEPEND}"

APACHE2_MOD_FILE="${S}/src/.libs/${PN}_streaming.so"
APACHE2_MOD_CONF="50_${PN}"
APACHE2_MOD_DEFINE="H264"

need_apache2

src_compile() {
	emake
}
