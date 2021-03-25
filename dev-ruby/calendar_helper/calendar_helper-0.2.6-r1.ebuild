# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="app init.rb"

inherit ruby-fakegem

DESCRIPTION="A simple helper for creating an HTML calendar"
HOMEPAGE="https://rubygems.org/gems/calendar_helper"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/flexmock )"

ruby_add_rdepend 'dev-ruby/open4'

each_ruby_test() {
	${RUBY} -Ilib test/test_calendar_helper.rb || die
}
