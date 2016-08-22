# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Captures stdout, stderr and (optionally) stdin; uses PTY to avoid buffering"
HOMEPAGE="https://github.com/xeger/backticks"
SRC_URI="https://github.com/xeger/backticks/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"

all_ruby_prepare() {
	sed -i -e '/coverall/I s:^:#:' spec/spec_helper.rb || die
}
