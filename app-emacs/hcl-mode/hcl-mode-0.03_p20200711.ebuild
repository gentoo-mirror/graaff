# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=e12b1df2ca28d2b06c471cd709c038a2dc0bcdbd

inherit elisp

IUSE=""

DESCRIPTION="Major mode of HCL (Hashicorp Configuration Language)"
HOMEPAGE="https://github.com/purcell/emacs-hcl-mode"
SRC_URI="https://github.com/purcell/emacs-hcl-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/emacs-${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="Changes README.md"

# Uses unpackaged cask
RESTRICT="test"
