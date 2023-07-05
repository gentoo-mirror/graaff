# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=27.1

inherit elisp

IUSE=""

DESCRIPTION="A polished Dired with batteries included"
HOMEPAGE="https://github.com/alexluigit/dirvish"
SRC_URI="https://github.com/alexluigit/dirvish/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/dirvish-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	>=app-emacs/transient-0.3.7
	sys-apps/coreutils
"

# Depends on Cask
RESTRICT="test"

DOCS="README.org docs"

src_prepare() {
	elisp_src_prepare

	mv extensions/*.el .
}
