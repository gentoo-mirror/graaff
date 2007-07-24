# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A screen ruler for GNOME"
HOMEPAGE="http://gnomecoder.wordpress.com/screenruler/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="http://info.openanswers.org/downloads/${P}.tar.gz"

RDEPEND="dev-lang/ruby
	dev-ruby/rcairo
	dev-ruby/ruby-gtk2
	dev-ruby/ruby-libglade2
	dev-ruby/ruby-gconf2"

src_unpack() {
	unpack "${A}"

	cd "${S}"
	sed -i -e "s/File.dirname(__FILE__)/'\/usr\/share\/gruler'/" gruler.rb
}

# There is no installation mechanism in the tarball, so just put
# everything in the right place
src_install() {
	insinto /usr/share/pixmaps
	doins "${S}"/gruler-icon.png

	insinto /usr/share/applications
	doins "${FILESDIR}"/gruler.desktop

	insinto /usr/share/gruler
	doins "${S}"/*.rb
	doins "${S}"/*glade*
	doins "${S}"/*.png
	insinto /usr/share/gruler/utils
	doins "${S}"/utils/*

	exeinto /usr/share/gruler
	doexe "${S}"/gruler.rb

	dosym /usr/share/gruler/gruler.rb /usr/bin/gruler
}
