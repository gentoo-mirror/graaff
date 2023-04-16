# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Allows to define default values for ActiveRecord models in a declarative manner"
HOMEPAGE="https://github.com/FooBarWidget/default_value_for"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.2.0:* <dev-ruby/activerecord-7:*"

ruby_add_bdepend "test? ( dev-ruby/minitest dev-ruby/minitest-around <dev-ruby/railties-7 )"

all_ruby_prepare() {
	sed -i -e '1igem "railties", "<7"; gem "activerecord", "<7"' test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib test.rb || die
}
