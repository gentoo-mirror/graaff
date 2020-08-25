# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI="https://dev.entrouvert.org/releases/lasso/lasso-2.6.0.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="C library aiming to implement the Liberty Alliance standards"
HOMEPAGE="https://lasso.entrouvert.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DOCS="ChangeLog NEWS README README.JAVA"

CDEPEND="
	dev-libs/glib
	dev-libs/libxml2
	dev-libs/libltdl
	dev-libs/openssl:0
	dev-libs/xmlsec
	dev-libs/libxslt
	sys-libs/zlib
"
DEPEND=${CDEPEND}
BDEPEND="virtual/pkgconfig"
RDEPEND=${CDEPEND}

src_configure() {

	# Avoid automagic dependencies for now. Disable tests because they
	# do not compile.
	econf \
		--disable-java \
		--disable-python \
		--disable-php5 \
		--disable-perl \
		--disable-tests
}
