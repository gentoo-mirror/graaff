# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
COMMIT=77ead97419092eccb35f2ba1710cb4a5bd8be86b

inherit elisp

DESCRIPTION="Presentations in Emacs -- based on Org-mode"
HOMEPAGE="https://github.com/eschulte/epresent"
SRC_URI="https://github.com/eschulte/epresent/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/epresent-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.org"
