# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools apache-module

SRC_URI="https://github.com/latchset/mod_auth_mellon/archive/v${PV}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="An Apache module with a simple SAML 2.0 service provider"
HOMEPAGE="https://github.com/latchset/mod_auth_mellon"

LICENSE="GPL-2+"
SLOT="0"
IUSE="diagnostics"
need_apache2_4

CDEPEND=">=dev-libs/lasso-2.1 net-misc/curl dev-libs/openssl:0= "
DEPEND+=" virtual/pkgconfig ${CDEPEND}"
RDEPEND=${CDEPEND}

DOCFILES="ECP.rst NEWS README.md"

APACHE2_MOD_CONF="10_${PN}"
APACHE2_MOD_DEFINE="AUTH_MELLON"

pkg_setup() {
	_init_apache2
	_init_apache2_late
}

src_prepare() {
	eapply_user

	eautoreconf

	econf $(use_enable diagnostics)
}

src_compile() {
	# Use -j1 to ensure that the apxs step is run first
	emake -j1
}

src_install() {
	apache-module_src_install

	newbin mellon_create_metadata.sh mellon_create_metadata
}
