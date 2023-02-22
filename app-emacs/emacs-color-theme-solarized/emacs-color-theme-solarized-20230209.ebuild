# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT=b186e5d62d0b83cbf5cf38f7eb7a199dea9a3ee3

inherit elisp

IUSE=""

DESCRIPTION="Emacs highlighting using Ethan Schoonover’s Solarized color scheme"
HOMEPAGE="https://github.com/sellout/emacs-color-theme-solarized"
SRC_URI="https://github.com/sellout/emacs-color-theme-solarized/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/emacs-color-theme-solarized-${COMMIT}"

SITEFILE="50${PN}-gentoo.el"
DOCS=README.md
