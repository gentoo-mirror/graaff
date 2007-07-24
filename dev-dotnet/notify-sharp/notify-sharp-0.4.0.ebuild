# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-dotnet/evolution-sharp/evolution-sharp-0.12.0.ebuild,v 1.5 2007/07/15 02:54:24 mr_bones_ Exp $

inherit eutils mono

DESCRIPTION="Mono bindings for libnotify"
HOMEPAGE="http://www.ndesk.org/NotifySharp"

SRC_URI="http://moving-innovations.com/~graaff/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc"

DEPEND=">=x11-libs/libnotify-0.4.4
	>=dev-lang/mono-1.1.13
	>=dev-dotnet/dbus-sharp-0.5.2
	>=dev-dotnet/gtk-sharp-2.0.0
	doc? ( dev-util/monodoc )"

pkg_setup() {
	if ! built_with_use dev-dotnet/dbus-sharp glib ; then
		die "dbus-sharp must be compiled with glib USE flag"
	fi
}

src_compile() {
	econf $(use_enable doc docs)
	emake
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS ChangeLog MAINTAINERS NEWS README
}
