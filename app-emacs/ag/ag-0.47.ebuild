# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

IUSE=""

DESCRIPTION="An Emacs frontend to ag, ('the silver searcher' ack replacement)"
HOMEPAGE="https://agel.readthedocs.io/en/latest/"
SRC_URI="https://github.com/Wilfred/ag.el/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}.el-${PV}"

SITEFILE="50${PN}-gentoo.el"

DEPEND="app-emacs/dash app-emacs/s"

RDEPEND="${DEPEND}
	sys-apps/the_silver_searcher
"
