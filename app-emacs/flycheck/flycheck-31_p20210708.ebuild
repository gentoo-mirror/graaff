# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=21d52264aa80bfa4ede94c59e37a20fb6d033b0c
FLYCHECK_VERSION=32

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
