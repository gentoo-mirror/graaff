# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

NEED_EMACS=26.1

inherit elisp

IUSE=""

DESCRIPTION="Emacs client/library for the Language Server Protocol"
HOMEPAGE="https://emacs-lsp.github.io/lsp-mode/"
SRC_URI="https://github.com/emacs-lsp/lsp-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/dash-2.14.1
	>=app-emacs/f-0.20.0
	>=app-emacs/ht-2.0
	app-emacs/lv
	>=app-emacs/markdown-mode-2.3
	>=app-emacs/spinner-1.7.3
"
DEPEND=${RDEPEND}

# Requires unpackaged dependencies, e.g. Cask
RESTRICT="test"
