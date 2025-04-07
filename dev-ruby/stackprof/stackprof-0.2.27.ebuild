# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTENSIONS=(ext/stackprof/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR="lib/stackprof"

inherit ruby-fakegem

DESCRIPTION="A fast sampling profiler for ruby code"
HOMEPAGE="https://github.com/tmm1/stackprof"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/minitest:5 dev-ruby/mocha )"

all_ruby_prepare() {
	sed -e '/mocha/ s/setup/minitest/' \
		-e 's/MiniTest/Minitest/' \
		-i test/test_*.rb || die
}

each_ruby_test() {
	${RUBY} -I lib:test:. -e 'Dir["test/**/test_*.rb"].each { require _1 }' || die
}
