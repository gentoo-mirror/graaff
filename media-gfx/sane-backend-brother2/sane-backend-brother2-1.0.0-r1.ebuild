# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="SANE Backend for Brother Scanners"
HOMEPAGE="http://solutions.brother.com/linux/en_us/"
SRC_URI="brother2-sane-src-1.0.0-r001.tar.gz"

S="${WORKDIR}/${P//sane-backend-/}"
At="brother2-sane-src-1.0.0-r001.tar.gz"

LICENSE="mixed"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RESTRICT="fetch"

DEPEND="media-gfx/sane-backends"
RDEPEND=""

pkg_nofetch() {
	einfo "Please download ${At} from:"
	einfo "http://solutions.brother.com/linux/sol/printer/linux/sane_drivers.html"
	einfo "Select the brscan2 file"
	einfo "and move it to ${DISTDIR}"
}

src_unpack() {
	if [ ! -r ${DISTDIR}/${At} ]; then
		die "cannot read ${At}. Please check the permission and try again."
	fi

	unpack ${At}

	einfo "Source: ${S}"
	cd ${S}

	epatch ${FILESDIR}/usb-claim.diff
	epatch ${FILESDIR}/sane-dir-rename.diff
}

src_compile() {
	einfo "Source: ${S}"
	make clean || die

	make || die
}

src_install() {
	dodoc readme copying.brother

	dolib.so ${S}/libbrcolm2/libbrcolm2.so.1.0.0
	dolib.so ${S}/libbrscandec2/libbrscandec2.so.1.0.0

	mkdir -p ${D}/usr/share/sane/Brother
	insinto /usr/share/sane/Brother
	doins ${S}/backend/Brsane2.ini

	mkdir -p ${D}/usr/share/sane/Brother/GrayCmData/all
	insinto /usr/share/sane/Brother/GrayCmData/all
	doins ${S}/libbrcolm2/GrayCmData/all/brmsl08f.cm

	insinto /usr/lib/sane
	insopts -m0755
	doins ${S}/backend/.libs/libsane-brother2.so.1.0.7

	cd ${D}/usr/lib/sane
	ln -s libsane-brother2.so.1.0.7 libsane-brother2.so.1

}

pkg_postinst() {
	echo
	ewarn "Please add the line:"
	ewarn "brother2"
	ewarn "to your /etc/sane.d/dll.conf file"
	echo
	ebeep 3
	epause 5
}
