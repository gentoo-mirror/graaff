# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

IUSE=""

DESCRIPTION="Emacs major mode for Ruby type signature (RBS) files"
HOMEPAGE="https://github.com/ybiquitous/rbs-mode/"
SRC_URI="https://github.com/ybiquitous/rbs-mode/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="CHANGELOG.md README.md"
