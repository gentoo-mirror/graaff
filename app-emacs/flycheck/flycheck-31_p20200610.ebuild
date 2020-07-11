# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=c02cd773dded0215f9417ec04dfe8dabda63ef43
FLYCHECK_VERSION=33

inherit elisp

IUSE=""

DESCRIPTION="On the fly syntax checking for GNU Emacs"
HOMEPAGE="https://github.com/flycheck/flycheck"
SRC_URI="https://github.com/flycheck/flycheck/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

RDEPEND=">=app-emacs/dash-2.12.1"
DEPEND=${RDEPEND}

S="${WORKDIR}/${PN}-${COMMIT}"

# Requires unpackaged dependencies, e.g. buttercup
RESTRICT="test"

src_prepare() {
	# Patch in the version number since we don't install via melpa.
	sed -i -e "s/(pkg-info-version-info 'flycheck)/"${FLYCHECK_VERSION}"/" flycheck.el || die

	sed -i -e '/^CASK/ s/^/#/' Makefile || die
	eapply_user
}
