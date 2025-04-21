# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Allows to define default values for ActiveRecord models in a declarative manner"
HOMEPAGE="https://github.com/FooBarWidget/default_value_for"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "|| ( dev-ruby/activerecord:7.0 dev-ruby/activerecord:7.1 )"

ruby_add_bdepend "test? ( dev-ruby/minitest dev-ruby/minitest-around <dev-ruby/railties-7.2 )"

each_ruby_test() {
	${RUBY} -Ilib test.rb || die
}
