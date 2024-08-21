# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT=e12b1df2ca28d2b06c471cd709c038a2dc0bcdbd

inherit elisp

DESCRIPTION="Major mode of HCL (Hashicorp Configuration Language)"
HOMEPAGE="https://github.com/hcl-emacs/hcl-mode"
SRC_URI="https://github.com/hcl-emacs/hcl-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

SITEFILE="50${PN}-gentoo.el"

DOCS="Changes README.md"
