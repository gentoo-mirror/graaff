# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing Groovy"
HOMEPAGE="https://github.com/russel/groovy-emacs-modes"
SRC_URI="https://github.com/russel/groovy-emacs-modes/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/groovy-emacs-modes-${PV}"

src_install() {
	elisp_src_install

	dodoc README.md
}
