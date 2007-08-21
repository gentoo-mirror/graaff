# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-emacs/eselect-emacs-1.1.ebuild,v 1.8 2007/08/01 04:04:06 metalgod Exp $

DESCRIPTION="Manages Ruby on Rails and Capistrano symlinks"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="http://moving-innovations.com/~graaff/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.0.10"

src_install() {
	insinto /usr/share/eselect/modules
	doins *.eselect || die "doins failed"
	dodoc ChangeLog || die "dodoc failed"
}
