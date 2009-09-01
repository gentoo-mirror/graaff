# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=2

inherit gems

MY_PV=${PV//./_}
DESCRIPTION="Implementation of a Ruby binding to Apple's cross-platform multicast DNS Service Discovery API."
HOMEPAGE="http://rubyforge.org/projects/dnssd/"
LICENSE="Ruby"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"

DEPEND="net-dns/avahi[mdnsresponder-compat]"
RDEPEND=${DEPEND}

