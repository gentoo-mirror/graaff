# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="Manage delta indexes via datetime columns for Thinking Sphinx."
HOMEPAGE="http://freelancing-god.github.com/ts/en/"
SRC_URI="mirror://rubygems/${P}.gem"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"

DEPEND=">=dev-ruby/thinking-sphinx-1.3.8"
RDEPEND="${DEPEND}"
