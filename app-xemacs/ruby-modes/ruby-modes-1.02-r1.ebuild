# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/ruby-modes/ruby-modes-1.02.ebuild,v 1.6 2007/12/24 02:36:23 jer Exp $

inherit xemacs-elisp

SLOT="0"
IUSE=""
DESCRIPTION="Ruby support."

RDEPEND="app-xemacs/xemacs-base
	app-xemacs/debug
	app-editors/xemacs"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"

SRC_URI="http://moving-innovations.com/~graaff/ruby-modes-1.02.tar.bz2"
