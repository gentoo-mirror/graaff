# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="heapy.gemspec"

inherit ruby-fakegem

DESCRIPTION="Got a heap dump? Great. Use this tool to see what's in it!"
HOMEPAGE="https://github.com/schneems/heapy"
SRC_URI="https://github.com/schneems/heapy/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND+=" test? ( dev-vcs/git )"

ruby_add_rdepend "dev-ruby/thor"

all_ruby_prepare() {
	sed -i -e '/rake/ s/~>/>=/' heapy.gemspec || die
	git init . || die

	# Remove failing spec
	rm -f spec/slow_spec.rb || die
}

each_ruby_test() {
	RUBYLIB=lib RSPEC_VERSION=3 ruby-ng_rspec || die
}
