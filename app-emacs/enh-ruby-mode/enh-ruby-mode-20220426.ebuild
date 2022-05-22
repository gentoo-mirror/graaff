# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby26 ruby27 ruby30 ruby31"

COMMIT=f240ac00ccbbd0916b5e3d272c0064a26f527ef8

inherit elisp ruby-single

IUSE="test"

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
RESTRICT="!test? ( test )"

src_test() {
	rake || die
}

src_install() {
	elisp_src_install

	elisp-install ${PN}/ruby ruby/*
}
