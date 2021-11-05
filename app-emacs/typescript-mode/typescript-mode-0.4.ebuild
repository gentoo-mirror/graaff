# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

IUSE=""

DESCRIPTION="Major mode for typescript files"
HOMEPAGE="https://github.com/emacs-typescript/typescript.el"
SRC_URI="https://github.com/emacs-typescript/typescript.el/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/typescript.el-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"

# Uses unpackaged Cask
RESTRICT="test"
