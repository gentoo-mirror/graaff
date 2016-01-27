# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

# Short one-line description of this package.
DESCRIPTION="Shamir's Secret Sharing Scheme"
HOMEPAGE="http://point-at-infinity.org/ssss/"
SRC_URI="http://point-at-infinity.org/ssss/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="dev-libs/gmp"
DEPEND="${RDEPEND} app-doc/xmltoman"

src_prepare() {
	epatch "${FILESDIR}"/ssss-0.5-makefile.patch
}

src_install() {
	dobin ssss-combine ssss-split
	doman ssss.1
	dodoc HISTORY
	dohtml ssss.1.html doc.html
}
