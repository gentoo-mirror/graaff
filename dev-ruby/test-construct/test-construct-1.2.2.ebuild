# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19 ruby20"

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
