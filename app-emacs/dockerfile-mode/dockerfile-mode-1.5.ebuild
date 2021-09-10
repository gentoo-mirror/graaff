# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=24

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing Dockerfiles"
HOMEPAGE="https://github.com/spotify/dockerfile-mode"
SRC_URI="https://github.com/spotify/dockerfile-mode/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
