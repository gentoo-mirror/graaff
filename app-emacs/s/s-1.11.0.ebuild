# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="The long lost Emacs string manipulation library"
HOMEPAGE="https://github.com/magnars/s.el"
SRC_URI="https://github.com/magnars/s.el/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}.el-${PV}"

SITEFILE="50${PN}-gentoo.el"
