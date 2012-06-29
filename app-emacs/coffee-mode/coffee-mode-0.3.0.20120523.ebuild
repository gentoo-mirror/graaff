# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/css-mode/css-mode-0.11.ebuild,v 1.10 2008/02/14 10:07:30 ulm Exp $

EAPI=4

inherit elisp

GIT_COMMIT="c45c5f7a529363bc7aa57db0f3df26389fd233d8"

IUSE=""

DESCRIPTION="A major mode for editing CoffeeScript"
HOMEPAGE="https://github.com/defunkt/coffee-mode"
SRC_URI="https://github.com/defunkt/coffee-mode/tarball/${GIT_COMMIT} -> ${P}-git.tgz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/defunkt-coffee-mode-* ${P} || die
}

src_install() {
	elisp_src_install

	dodoc README.md
}
