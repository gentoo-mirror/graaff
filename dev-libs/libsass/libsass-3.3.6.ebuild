# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="A C/C++ implementation of a Sass compiler"
HOMEPAGE="http://sass-lang.com/libsass"
SRC_URI="https://github.com/sass/libsass/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"

KEYWORDS="~amd64"

IUSE=""

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default

	dodoc docs/*
}
