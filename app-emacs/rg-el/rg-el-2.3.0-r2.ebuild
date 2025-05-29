# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=25.1

inherit elisp

DESCRIPTION="Emacs search tool based on ripgrep"
HOMEPAGE="https://github.com/dajva/rg.el"
SRC_URI="https://github.com/dajva/rg.el/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/rg.el-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo-r2.el"

RDEPEND="
	>=app-emacs/transient-0.3.0
	>=app-emacs/wgrep-2.1.10
	sys-apps/ripgrep
"

IUSE="test"

# Depends on Cask
RESTRICT="test"

DOCS="README.md"
