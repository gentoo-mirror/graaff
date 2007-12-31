# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_gnutls/mod_gnutls-0.2.0.ebuild,v 1.5 2007/04/11 14:50:01 chtekk Exp $

inherit apache-module ssl-cert

KEYWORDS="amd64 ~sparc ~x86"

DESCRIPTION="mod_gnutls uses GnuTLS to provide SSL v3, TLS 1.0 and TLS 1.1 encryption for Apache2, similarly to mod_ssl."
HOMEPAGE="http://www.outoforder.cc/projects/apache/mod_gnutls/"
SRC_URI="http://www.outoforder.cc/downloads/${PN}/${P}.tar.bz2"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=">=net-libs/gnutls-2.1.7"
RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="47_${PN}"
APACHE2_MOD_DEFINE="GNUTLS"

DOCFILES="LICENSE NEWS NOTICE README README.ENV"

need_apache2

src_compile() {
	econf --with-apxs=${APXS2} || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	mv -f "src/.libs/libmod_gnutls.so" "src/.libs/${PN}.so"

	insinto "${APACHE2_CONFDIR}"
	doins data/rsafile data/dhfile

	keepdir "${APACHE2_CONFDIR}/ssl"
	keepdir /var/cache/${PN}

	apache-module_src_install
}

pkg_postinst() {
	ewarn "For mod_gnutls to work properly it needs an RSA private key and DH parameters"
	ewarn "If you don't have these you can create them manually using these commands"
	ewarn ""
	ewarn "  certtool --generate-privkey --bits 512 --outfile rsafile"
	ewarn "  certtool --generate-dh-params --bits 1024 --outfile dhfile"
}
