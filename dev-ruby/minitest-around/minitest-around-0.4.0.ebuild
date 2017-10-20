# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Alternative for setup/teardown dance"
HOMEPAGE="https://github.com/splattael/minitest-around"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/minitest:5"

ruby_add_bdepend "test? ( dev-ruby/bundler )"

all_ruby_prepare() {
	sed -i -e '/bump/ s:^:#:' -e '/ls-files/d' minitest-around.gemspec Rakefile || die
}

each_ruby_test() {
	for f in test/*_{test,spec}.rb ; do
		${RUBY} -S rake test:isolated TEST="${f}" || die
	done
}
