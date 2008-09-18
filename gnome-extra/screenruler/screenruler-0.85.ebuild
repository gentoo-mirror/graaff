# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils fdo-mime

DESCRIPTION="Measure objects on your screen"
HOMEPAGE="http://gnomecoder.wordpress.com/screenruler/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="http://launchpad.net/screenruler/trunk/0.85/+download/${P}.tar.gz"

RDEPEND="dev-lang/ruby
	dev-ruby/rcairo
	dev-ruby/ruby-gtk2
	dev-ruby/ruby-libglade2
	dev-ruby/ruby-gconf2"

src_unpack() {
	unpack "${A}"

	cd "${S}"
	sed -i -e "s/File.dirname(__FILE__)/'\/usr\/share\/screenruler'/" screenruler.rb
}

# There is no installation mechanism in the tarball, so just put
# everything in the right place
src_install() {
	insinto /usr/share/pixmaps
	doins "${S}"/screenruler-icon.png

	make_desktop_entry screenruler "Screen Ruler" screenruler-icon "Utility;Gnome;GTK;"

	insinto /usr/share/screenruler
	doins "${S}"/*.rb
	doins "${S}"/*glade*
	doins "${S}"/*.png
	insinto /usr/share/screenruler/utils
	doins "${S}"/utils/*

	exeinto /usr/share/screenruler
	doexe "${S}"/screenruler.rb

	dosym /usr/share/screenruler/screenruler.rb /usr/bin/screenruler
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
