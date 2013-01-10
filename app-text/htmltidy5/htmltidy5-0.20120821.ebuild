# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/htmltidy/htmltidy-20090325-r1.ebuild,v 1.4 2012/05/29 17:01:06 aballier Exp $

EAPI=4

GIT_COMMIT="0cf6d998431a61f1bd630e7883d4d43df4ad8ccc"

inherit eutils autotools

DESCRIPTION="Tidy the layout and correct errors in HTML and XML documents"
HOMEPAGE="http://tidy.sourceforge.net/"
SRC_URI="https://github.com/w3c/tidy-html5/archive/${GIT_COMMIT}.zip -> ${P}-git.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug doc static-libs"

DEPEND="doc? ( app-doc/doxygen )"
RDEPEND="!!app-text/htmltidy"

S="${WORKDIR}"/tidy-html5-${GIT_COMMIT}

src_prepare() {
	# Required to setup the source dist for autotools
	einfo "Setting up autotools for source build"
	cp -R  ./build/gnuauto/* . || die "could not prepare autotools environment"

	# Stop tidy from appending -O2 to our CFLAGS
#	epatch "${FILESDIR}"/htmltidy-5.10.26-strip-O2-flag.patch

	# Define /etc/tidyrc for system wide config, bug 154834
#	epatch "${FILESDIR}"/htmltidy-20090325-tidyrc.patch

	eautoreconf
}

src_compile() {
	default

	if use doc ; then
		doxygen htmldoc/doxygen.cfg  || die "error making apidocs"
	fi
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable static-libs static)
}

src_install() {
	default

	find "${ED}" -name '*.la' -exec rm -f {} +

	# If use 'doc' is set, then we also want to install the
	# api documentation
	use doc && dohtml -r htmldoc/api
}
