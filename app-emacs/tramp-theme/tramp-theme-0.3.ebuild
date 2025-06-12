# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="Custom theme for remote buffers"
HOMEPAGE="https://elpa.gnu.org/packages/tramp-theme.html"
SRC_URI="https://elpa.gnu.org/packages/${P}.tar"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README"
