# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
COMMIT=29df3d081c6a1cbdf840cd13d45ea1c100c5bbaa

inherit elisp

DESCRIPTION="An RSpec minor mode for Emacs "
HOMEPAGE="https://github.com/pezra/rspec-mode"
SRC_URI="https://github.com/pezra/rspec-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/rspec-mode-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"
