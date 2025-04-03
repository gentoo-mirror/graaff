# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Get memory usage of a process in Ruby"
HOMEPAGE="https://github.com/zombocom/get_process_mem"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/bigdecimal-2.0 dev-ruby/ffi:0"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' test/test_helper.rb || die
}
