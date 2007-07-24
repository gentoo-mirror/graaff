# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/gruff/gruff-0.1.1.ebuild,v 1.4 2006/04/17 23:17:59 caleb Exp $

inherit ruby gems

MY_P=${P/sysloglogger/SyslogLogger}
S=${WORKDIR}/${MY_P}

USE_RUBY="ruby18"
DESCRIPTION="A Logger replacement that logs to syslog."
HOMEPAGE="http://radius.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${MY_P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="test"

DEPEND=">=dev-lang/ruby-1.8.4
	>=dev-ruby/hoe-1.2.0"
