# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

GIT_COMMIT="40886bc4cc5b1e855d6bb78505ebc651593d409d"

IUSE=""

DESCRIPTION="A major mode for editing Cucumber stories."
HOMEPAGE="https://github.com/michaelklishin/cucumber.el"
SRC_URI="https://github.com/michaelklishin/cucumber.el/archive/${GIT_COMMIT}.tar.gz -> ${P}-git.tgz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/cucumber.el-${GIT_COMMIT}"

src_install() {
	elisp_src_install

	dodoc README.md
}
