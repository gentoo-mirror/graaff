# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=b59b66a5369816c3a6d47b3702b9007431b7b4cf

inherit elisp

IUSE=""

DESCRIPTION="Emacs major mode for elm"
HOMEPAGE="https://github.com/jcollard/elm-mode"
SRC_URI="https://github.com/jcollard/elm-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"

DEPEND="app-emacs/f app-emacs/let-alist app-emacs/s app-emacs/reformatter"
RDEPEND=${DEPEND}
