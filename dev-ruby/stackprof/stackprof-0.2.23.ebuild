# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTENSIONS=(ext/stackprof/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="A fast sampling profiler for ruby code"
HOMEPAGE="https://github.com/tmm1/stackprof"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest:5 dev-ruby/mocha )"

each_ruby_test() {
	${RUBY} -I lib:test:. -e 'Dir["test/**/test_*.rb"].each { require _1 }' || die
}
