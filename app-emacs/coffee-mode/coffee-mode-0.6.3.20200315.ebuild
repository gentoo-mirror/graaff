# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=35a41c7d8233eac0b267d9593e67fb8b6235e134

inherit elisp

IUSE=""

DESCRIPTION="A major mode for editing CoffeeScript"
HOMEPAGE="https://github.com/defunkt/coffee-mode"
SRC_URI="https://github.com/defunkt/coffee-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/coffee-mode-${COMMIT}"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	sed -i -e 's/$(CASK) exec//' Makefile || die

	# Avoid version test since it no longer matches due to snapshot
	sed -i -e '/coffee-mode-version/,/^;/ s:^:;:' test/coffee-command.el || die

	default
}

src_install() {
	elisp_src_install

	dodoc README.md
}
