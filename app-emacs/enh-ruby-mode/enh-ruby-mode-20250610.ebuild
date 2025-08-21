# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

COMMIT=77ae0f5e0e0b655539d0c2fce09582adf732fdcc

inherit elisp ruby-single

DESCRIPTION="Major mode for editing Ruby files"
HOMEPAGE="https://github.com/zenspider/enhanced-ruby-mode"
SRC_URI="https://github.com/zenspider/enhanced-ruby-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/enhanced-ruby-mode-${COMMIT}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.rdoc"

DEPEND="test? ( dev-ruby/rake )"

IUSE="test"

RESTRICT="!test? ( test )"

src_test() {
	rake || die
}

src_install() {
	elisp_src_install

	elisp-install ${PN}/ruby ruby/*
}
