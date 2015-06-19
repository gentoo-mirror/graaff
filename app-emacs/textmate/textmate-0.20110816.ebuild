# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/css-mode/css-mode-0.11.ebuild,v 1.10 2008/02/14 10:07:30 ulm Exp $

EAPI=4

inherit elisp

GIT_COMMIT="350918b070148f0ace6d9d3cd4ebcaf15c1a8781"

IUSE=""

DESCRIPTION="Basic emulation of awesome TextMate features for Emacs."
HOMEPAGE="https://github.com/defunkt/textmate.el"
SRC_URI="https://github.com/defunkt/textmate.el/tarball/${GIT_COMMIT} -> ${P}-git.tgz"
LICENSE="GPL-3 FDL-1.3 BSD as-is MIT W3C unicode PSF-2"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/defunkt-textmate.el-* ${P} || die
}

src_install() {
	elisp_src_install

	dodoc README.markdown
}
