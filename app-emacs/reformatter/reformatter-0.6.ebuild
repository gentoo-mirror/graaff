# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

IUSE=""

DESCRIPTION="Define commands which run reformatters on the current buffer"
HOMEPAGE="https://github.com/purcell/reformatter.el"
SRC_URI="https://github.com/purcell/reformatter.el/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/emacs-reformatter-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS=( README.md )

# Tries to use network and download code
RESTRICT="test"
