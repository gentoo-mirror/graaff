# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="WebDriver <-> Marionette proxy"
HOMEPAGE="https://github.com/mozilla/geckodriver"
SRC_URI="https://github.com/mozilla/geckodriver/releases/download/v${PV}/geckodriver-v${PV}-linux64.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}

src_install() {
	dobin geckodriver
}
