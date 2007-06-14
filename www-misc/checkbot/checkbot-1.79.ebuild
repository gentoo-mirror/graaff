# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/hoe/hoe-1.2.1.ebuild,v 1.1 2007/06/04 20:47:21 graaff Exp $

inherit perl-app

DESCRIPTION="Checkbot is a tool to verify links on a set of HTML pages."
HOMEPAGE="http:/degraaff.org/checkbot/"
SRC_URI="http://degraaff.org/checkbot/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/perl-5.5
    >=dev-perl/libwww-perl-5.803
    >=dev-perl/URI-1.10
    >=dev-perl/HTML-Parser-3.33
    >=virtual/perl-MIME-Base64-2.00
    >=virtual/perl-libnet-1.19
    virtual/perl-Digest-MD5
    dev-perl/MailTools
    dev-perl/Time-Duration
    dev-perl/Crypt-SSLeay"
