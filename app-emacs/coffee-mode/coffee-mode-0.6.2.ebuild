# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/css-mode/css-mode-0.11.ebuild,v 1.10 2008/02/14 10:07:30 ulm Exp $

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing CoffeeScript"
HOMEPAGE="https://github.com/defunkt/coffee-mode"
SRC_URI="https://github.com/defunkt/coffee-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	sed -i -e 's/$(CASK) exec//' Makefile || die
}

src_install() {
	elisp_src_install

	dodoc README.md
}
