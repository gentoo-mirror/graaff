# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit ruby gems

DESCRIPTION="Executable feature scenarios"
HOMEPAGE="http://github.com/aslakhellesoy/cucumber/wikis"
LICENSE="Ruby"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"

RDEPEND=">=dev-ruby/term-ansicolor-1.0.3
	>=dev-ruby/treetop-1.2.4
	>=dev-ruby/diff-lcs-1.1.2
	>=dev-ruby/polyglot-0.2.4
	>=dev-ruby/builder-2.1.2
	>=dev-ruby/hoe-1.8.2"
