# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools

DESCRIPTION="A GTK+-based LDAP client"
HOMEPAGE="http://sourceforge.net/projects/gqclient/"
SRC_URI="mirror://sourceforge/gqclient/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# More use flags are needed because now there are a number of
# automagic dependencies.
IUSE="kerberos gnome-keyring"

RDEPEND=">=x11-libs/gtk+-2.6:2
	>=net-nds/openldap-2
	kerberos? ( virtual/krb5 )
	dev-libs/openssl
	dev-libs/libxml2
	>=dev-libs/glib-2.6:2
	x11-libs/pango
	dev-libs/cyrus-sasl
	gnome-keyring? ( >=gnome-base/gnome-keyring-0.4.4 )
	>=gnome-base/libglade-2"
DEPEND="${RDEPEND}
	app-text/rarian
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}/${P}-crypto.patch"
	epatch "${FILESDIR}/${P}-autoconf.patch"

	eautoreconf
}

src_configure() {
	local myconf="--enable-browser-dnd --enable-cache --disable-update-mimedb"
	use kerberos && myconf="${myconf} --with-kerberos-prefix=/usr"
	use gnome-keyring && myconf="${myconf} --with-keyring-api=gnome"

	econf ${myconf} || die "econf failed"
}

src_install() {
	rm -f "${D}"/usr/share/locale/locale.alias
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README* TODO
}
