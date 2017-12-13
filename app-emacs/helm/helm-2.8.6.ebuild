# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

IUSE=""

DESCRIPTION="Framework for incremental completions and narrowing selections"
HOMEPAGE="https://github.com/emacs-helm/helm"
SRC_URI="https://github.com/emacs-helm/helm/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="2"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DEPEND="app-emacs/dash app-emacs/s"

RDEPEND="${DEPEND}
	sys-apps/the_silver_searcher
"
