# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="A concise and easy-to-use Ruby library that connects ActiveRecord to the Sphinx search daemon."
HOMEPAGE="http://freelancing-god.github.com/ts/en/"
SRC_URI="http://gemcutter.org/gems/${P}.gem"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"

DEPEND=">=dev-ruby/activerecord-1.15.6
	>=dev-ruby/riddle-1.0.8
	>=dev-ruby/after_commit-1.0.5"
RDEPEND="${DEPEND}"
