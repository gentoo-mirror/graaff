# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Full text search engine with support for various languages and DBs"
HOMEPAGE="http://qwik.jp/senna/"
SRC_URI="mirror://sourceforge.jp/${PN}/33763/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mecab ruby unicode" #TODO python php"

DEPEND="mecab? ( >=app-text/mecab-0.81 )
	ruby? ( virtual/ruby )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-extconf.patch"
}

src_configure() {
	local myconf
	use unicode && myconf="--with-encoding=utf8"

	econf \
		$(use_with mecab) \
		${myconf} \
		|| die "econf failed"
}

src_compile() {
	emake || die "emake failed"

	if use ruby; then
		cd "${S}"/bindings/ruby
		ruby extconf.rb --with-senna-dir="${S}"
		emake
	fi
}

src_install() {
	emake install-strip DESTDIR="${D}" || die "make install failed"
	use ruby && emake install-ruby-bindings DESTDIR="${D}"
	dodoc ChangeLog NEWS doc/*
}
