# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing HAML"
HOMEPAGE="https://github.com/nex3/haml-mode"
SRC_URI="https://github.com/nex3/haml-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

RDEPEND=">=app-emacs/haml-mode-3.0.15"
