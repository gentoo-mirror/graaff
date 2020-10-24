# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

IUSE=""

DESCRIPTION="an elisp HTTP library"
HOMEPAGE="https://github.com/tkf/emacs-request"
SRC_URI="https://github.com/tkf/emacs-request/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/emacs-request-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DOCS="README.rst"

# tests depend on cask
RESTRICT=test

src_prepare() {
	# deferred support appears experimental and not published on melpa
	rm -f request-deferred.el || die

	default
}
