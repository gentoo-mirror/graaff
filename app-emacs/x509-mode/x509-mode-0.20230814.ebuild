# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
COMMIT=57395a72087875108245f384acd9327db8b59abb

inherit elisp

IUSE=""

DESCRIPTION="View certificates and CRLs using OpenSSL in Emacs"
HOMEPAGE="https://github.com/jobbflykt/x509-mode"
SRC_URI="https://github.com/jobbflykt/x509-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/x509-mode-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"

RDEPEND="dev-libs/openssl"

# Tries to download elpa data
RESTRICT="test"
