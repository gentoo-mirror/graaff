# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

IUSE=""

DESCRIPTION="Simple library for asynchronous processing in Emacs"
HOMEPAGE="https://github.com/jwiegley/emacs-async"
SRC_URI="https://github.com/jwiegley/emacs-async/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2+"
SLOT="1"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
