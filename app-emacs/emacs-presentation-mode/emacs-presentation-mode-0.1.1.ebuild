# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

IUSE=""
DESCRIPTION="Display large character for presentation and live coding"
HOMEPAGE="https://github.com/zonuexe/emacs-presentation-mode"
SRC_URI="https://github.com/zonuexe/emacs-presentation-mode/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
DOCS=README.org
