# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DATE=20140624

inherit eutils

DESCRIPTION="Supermicro IPMIView tool"
HOMEPAGE="ftp://ftp.supermicro.com/utility/IPMIView/"
SRC_URI="ftp://ftp.supermicro.com/utility/IPMIView/Linux/IPMIView_${PV}_bundleJRE_Linux_${DATE}.tar.gz"
LICENSE="MIT"

S="${WORKDIR}/IPMIView_${PV}_bundleJRE_Linux_${DATE}"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

# Accept the JRE TEXTRELs for now as long as we need to use the bundled
# version.
QA_TEXTRELS="opt/ipmiview/jre/lib/i386/client/libjvm.so opt/ipmiview/jre/lib/i386/motif21/libmawt.so opt/ipmiview/jre/lib/i386/server/libjvm.so"

src_install() {
	insinto /opt/ipmiview
	doins *

	exeinto /opt/ipmiview
	doexe IPMIView20

	dosym /opt/ipmiview/IPMIView20 /usr/bin/IPMIView20

	dodoc ReleaseNote.txt

	# Also install the bundled jre version since IPMIView20 doesn't seem
	# to like a modern Java version such as icedtea 1.7: the script
	# won't accept this java version.
	doins -r jre
	exeinto /opt/ipmiview/jre/bin
	doexe jre/bin/*
}
