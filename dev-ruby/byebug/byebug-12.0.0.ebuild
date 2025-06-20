# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md GUIDE.md README.md"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

RUBY_FAKEGEM_BINDIR="exe"

RUBY_FAKEGEM_EXTENSIONS=(ext/byebug/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR=lib/byebug

inherit ruby-fakegem

DESCRIPTION="a Ruby 2 debugger"
HOMEPAGE="https://github.com/deivid-rodriguez/byebug"
SRC_URI="https://github.com/deivid-rodriguez/byebug/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# Tests require bundler and hang when run from portage
RESTRICT="test"

ruby_add_bdepend "test? (
	dev-ruby/byebug
	dev-ruby/pry
)"

all_ruby_prepare() {
	sed -i -e '/simplecov/ s:^:#:' test/test_helper.rb || die
	sed -i -e 's:_relative ": "./:' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	NOCOV=true ${RUBY} -r./test/minitest_runner -e Byebug::MinitestRunner.new.run || die
}
