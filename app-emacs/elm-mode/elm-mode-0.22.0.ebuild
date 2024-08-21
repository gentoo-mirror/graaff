# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="Emacs major mode for elm"
HOMEPAGE="https://github.com/jcollard/elm-mode"
SRC_URI="https://github.com/jcollard/elm-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"

DEPEND="
	>=app-emacs/f-0.17
	>=app-emacs/reformatter-0.3
	>=app-emacs/s-1.7.0
"
RDEPEND=${DEPEND}
