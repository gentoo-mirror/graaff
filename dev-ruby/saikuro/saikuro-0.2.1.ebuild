# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rmagick/rmagick-1.15.8.ebuild,v 1.1 2007/08/04 06:54:34 graaff Exp $

inherit ruby

DESCRIPTION="A Ruby cyclomatic complexity analyzer."
HOMEPAGE="http://saikuro.rubyforge.org/"
SRC_URI="http://rubyforge.org/frs/download.php/15567/saikuro_v${PV}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="virtual/ruby"

S="${WORKDIR}/saikuro"
