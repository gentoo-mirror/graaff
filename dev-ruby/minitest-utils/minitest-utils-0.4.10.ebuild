# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="minitest-utils.gemspec"

inherit ruby-fakegem

DESCRIPTION="Some utilities for your Minitest day-to-day usage"
HOMEPAGE="https://github.com/fnando/minitest-utils"
SRC_URI="https://github.com/fnando/minitest-utils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "dev-ruby/minitest"

ruby_add_bdepend "test? ( dev-ruby/bundler )"

all_ruby_prepare() {
	sed --e '/\(pry\|rubocop\|test_notifier\)/ s:^:#:' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -e '/rubocop/I s:^:#:' \
		-i Rakefile || die
}
