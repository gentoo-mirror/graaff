# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"

inherit ruby-fakegem

DESCRIPTION="This library provides iCalendar support for ruby. (RFC-2445)"
HOMEPAGE="http://github.com/sdague/icalendar"
LICENSE="|| ( GPL-2 BSD Ruby )"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

ruby_add_bdepend "doc? ( >=dev-ruby/hoe-2.1.0 )"
ruby_add_bdepend "test? ( >=dev-ruby/hoe-2.1.0 )"

all_ruby_prepare() {
	sed -i '/newgem/d' Rakefile || die
}
