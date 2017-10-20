# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Allows to define default values for ActiveRecord models in a declarative manner"
HOMEPAGE="https://github.com/FooBarWidget/default_value_for"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.2.0:* <dev-ruby/activerecord-5.2:*"

ruby_add_bdepend "test? ( dev-ruby/minitest dev-ruby/minitest-around )"

each_ruby_test() {
	${RUBY} -Ilib test.rb || die
}
