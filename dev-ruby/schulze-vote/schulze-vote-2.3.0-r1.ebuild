# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="schulze-vote.gemspec"

inherit ruby-fakegem

DESCRIPTION="Schulze voting method (with help of the Floyd-Warshall algorithm)"
HOMEPAGE="https://github.com/coorasse/schulze-vote"
SRC_URI="https://github.com/coorasse/schulze-vote/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -i -e '/codeclimate/I s:^:#:' spec/spec_helper.rb || die
}
