# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit ruby gems

MY_PN="fiveruns_tuneup"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Treetop is a language for describing languages."
HOMEPAGE="http://treetop.rubyforge.org/"
SRC_URI="http://gems.rubyforge.org/gems/${MY_P}.gem"
LICENSE="Ruby"

KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""

RDEPEND="dev-ruby/activesupport"
