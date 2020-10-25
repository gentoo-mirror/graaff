# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

COMMIT=54a6ecf55304fba7d215ef38a4ec96daff2f35a4

IUSE=""

DESCRIPTION="Automatically detect the programming language in a buffer or string"
HOMEPAGE="https://github.com/andreasjansson/language-detection.el"
SRC_URI="https://github.com/andreasjansson/language-detection.el/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/language-detection.el-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DOCS="README.md"
