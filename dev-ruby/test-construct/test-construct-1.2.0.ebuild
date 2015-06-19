# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.markdown"

inherit ruby-fakegem

DESCRIPTION="Construct is a DSL for creating temporary files and directories during testing."
HOMEPAGE="http://github.com/devver/construct"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/test-unit:2 )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/ s:^:#:' test/construct_test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb-2 test/*_test.rb || die
}
