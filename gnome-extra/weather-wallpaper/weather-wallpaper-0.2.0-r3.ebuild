# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Program which connects to NOAA each hour to get the current weather
at the specified location and creates and sets a wallpaper with the data
retrieved."
HOMEPAGE="http://mundogeek.net/weather-wallpaper/"
SRC_URI="http://mundogeek.net/repo/pool/ubuntu/all/weather-wallpaper_0.2.0-1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
LANGS="linguas_ar linguas_ca linguas_cs linguas_de linguas_en_CA linguas_en_GB
linguas_es linguas_eu linguas_fi linguas_fr linguas_ga linguas_gl linguas_it
linguas_nb linguas_nl linguas_pl linguas_pt linguas_pt_BR linguas_ro linguas_ru
linguas_st"
IUSE="${LANGS}"

DEPEND=">=dev-python/pymetar-0.12
		>=dev-python/pygtk-2.10.4
		>=media-gfx/imagemagick-6.3.5.9
		>=media-gfx/inkscape-0.45.1"
RDEPEND=""

src_unpack() {
	unpack ${A}
}
src_compile(){
	echo "No compile necesary"
}
src_install() {
	local LANG
	cd ${P}.orig
	epatch ${FILESDIR}/weather-wallpaper-0.2.0-r2.patch
	pwd
	dodir ${ROOT}/usr/share/${PN}/
	dodir ${ROOT}/usr/share/${PN}/images/
	cp images/* ${D}/usr/share/${PN}/images/
	use linguas_ar && LANG="${LANG} ar"
	use linguas_ca && LANG="${LANG} ca"
	use linguas_cs && LANG="${LANG} cs"
	use linguas_de && LANG="${LANG} de"
	use linguas_en_CA && LANG="${LANG} en_CA"
	use linguas_en_GB && LANG="${LANG} en_GB"
	use linguas_es && LANG="${LANG} es"
	use linguas_eu && LANG="${LANG} eu"
	use linguas_fi && LANG="${LANG} fi"
	use linguas_fr && LANG="${LANG} fr"
	use linguas_ga && LANG="${LANG} ga"
	use linguas_gl && LANG="${LANG} gl"
	use linguas_it && LANG="${LANG} it"
	use linguas_nb && LANG="${LANG} nb"
	use linguas_nl && LANG="${LANG} nl"
	use linguas_pl && LANG="${LANG} pl"
	use linguas_pt && LANG="${LANG} pt"
	use linguas_pt_BR && LANG="${LANG} pt_BR"
	use linguas_ro && LANG="${LANG} ro"
	use linguas_ru && LANG="${LANG} ru"
	use linguas_st && LANG="${LANG} st"
	for language in `echo ${LANG}`; do
		insinto ${ROOT}/usr/share/locale/${language}/LC_MESSAGES/
		doins po/${language}/LC_MESSAGES/${PN}.mo
	done
	exeinto ${ROOT}/usr/bin
	doexe ${PN}
	newicon ${PN}.svg ${PN}.svg
	domenu ${PN}.desktop
	doman "${PN}.1"
}
