# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT=d14d22ad7029cdf4d11825ee3c96922e8fbb0122

DESCRIPTION="Converts MySQL dump to SQLite3 compatible dump"
HOMEPAGE="https://github.com/dumblob/mysql2sqlite"
SRC_URI="https://github.com/dumblob/mysql2sqlite/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-alternatives/awk"
DEPEND="${RDEPEND}"

src_install() {
	dodoc README.md
	dobin mysql2sqlite
}
