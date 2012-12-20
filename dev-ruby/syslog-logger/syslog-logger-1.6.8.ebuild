# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Logger::Syslog is a Logger replacement that logs to syslog."
HOMEPAGE="http://github.com/ngmoco/sysloglogger"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/test-unit )"

each_ruby_test() {
	ruby-ng_testrb-2 -Ilib test/test_*.rb || die
}
