# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="backticks.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Captures stdout, stderr and (optionally) stdin; uses PTY to avoid buffering"
HOMEPAGE="https://github.com/xeger/backticks"
SRC_URI="https://github.com/xeger/backticks/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"

all_ruby_prepare() {
	sed -i -e '/pry/ s:^:#:' -e '/coverall/I s:^:#:' spec/spec_helper.rb || die
}
