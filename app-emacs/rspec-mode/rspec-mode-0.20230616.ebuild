# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
COMMIT=3f039ae3fda9e52433a8c31d4b6c78c89e559906

inherit elisp

IUSE=""

DESCRIPTION="An RSpec minor mode for Emacs "
HOMEPAGE="https://github.com/pezra/rspec-mode"
SRC_URI="https://github.com/pezra/rspec-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/rspec-mode-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"
