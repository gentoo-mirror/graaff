# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="Bonjour-based method of getting git repositories and cloning them."
HOMEPAGE="http://gitjour.rubyforge.org/"
LICENSE="Ruby"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="doc"

USE_RUBY="ruby18"

DEPEND=">=dev-ruby/dnssd-0.7.1
	>=dev-ruby/rubygems-1.3.0"
RDEPEND=${DEPEND}
