# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="A modern watch command. Time machine and pager etc."
HOMEPAGE="https://github.com/sachaos/viddy"

SRC_URI="https://github.com/sachaos/viddy/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://moving-innovations.com/~graaff/${P}-deps.tar.xz"

#S="${WORKDIR}/viddy-${PV}"

LICENSE="BSD"
#RESTRICT+=" test"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-go/gox"

src_compile() {
	ego build
}

src_install() {
	dobin viddy
	dodoc README.md
}
