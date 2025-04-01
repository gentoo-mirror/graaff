# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="backticks.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Captures stdout, stderr and (optionally) stdin; uses PTY to avoid buffering"
HOMEPAGE="https://github.com/xeger/backticks"
SRC_URI="https://github.com/xeger/backticks/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -e 's/git ls-files -z/find * -print0/' -i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '/pry/ s:^:#:' -e '/coverall/I s:^:#:' spec/spec_helper.rb || die

	# Avoid specs requiring a terminal
	sed -i -e '/given interactive is true/ s/context/xcontext/' spec/backticks/command_spec.rb || die
}
