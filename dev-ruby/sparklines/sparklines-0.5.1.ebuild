# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="Create sparklines, small graphs to be used inline in texts."
HOMEPAGE="http://sparklines.rubyforge.org/"
LICENSE="MIT"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

DEPEND=">=dev-ruby/ruby-gd-0.7.4
	>=dev-ruby/hoe-1.5.1"
