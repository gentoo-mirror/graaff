# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/css-mode/css-mode-0.11.ebuild,v 1.10 2008/02/14 10:07:30 ulm Exp $

EAPI=4

inherit elisp

GIT_COMMIT="0bb4c233257950fca559d070673416db1c795fab"

IUSE=""

DESCRIPTION="A major mode for editing Cucumber stories."
HOMEPAGE="https://github.com/michaelklishin/cucumber.el"
SRC_URI="https://github.com/michaelklishin/cucumber.el/tarball/${GIT_COMMIT} -> ${P}-git.tgz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/michaelklishin-cucumber.el-* ${P} || die
}

src_install() {
	elisp_src_install

	dodoc README
}
