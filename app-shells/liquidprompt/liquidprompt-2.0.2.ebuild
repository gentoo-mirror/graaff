# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A full-featured & carefully designed adaptive prompt for Bash & Zsh"
HOMEPAGE="https://github.com/nojhan/liquidprompt"
SRC_URI="https://github.com/nojhan/liquidprompt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#S="${WORKDIR}/${PN}-${PV}"

LICENSE="AGPL-3"
SLOT="0"

KEYWORDS="~amd64"
IUSE=""

src_install() {
	dodoc example.bashrc CHANGELOG.md README.md

	# The included debian and arch packages install liquidprompt in
	# /usr/bin
	insinto /usr/share/liquidprompt
	doins liquidprompt
	doins liquid.theme
	doins liquid.ps1
	insinto /etc/
	newins liquidpromptrc-dist liquidpromptrc
}
