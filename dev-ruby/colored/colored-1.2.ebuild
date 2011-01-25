# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Console coloring"
HOMEPAGE="http://github.com/defunkt"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

each_ruby_prepare() {
	sed -i -e '/[Mm][Gg]/d' Rakefile || die
}
