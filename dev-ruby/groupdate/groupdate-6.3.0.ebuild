# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="groupdate.gemspec"
RUBY_FAKEGEM_TASK_TEST="test:enumerable test:sqlite"

inherit ruby-fakegem

DESCRIPTION="The simplest way to group temporal data"
HOMEPAGE="https://github.com/ankane/groupdate"
SRC_URI="https://github.com/ankane/groupdate/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-6.1:*"

ruby_add_bdepend "test? ( >=dev-ruby/activerecord-6.1[sqlite] )"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile test/test_helper.rb || die
	sed -i -e '3irequire "groupdate"' test/test_helper.rb || die

	sed -i -e 's:_relative ": "./:' ${RUBY_FAKEGEM_GEMSPEC} || die
}
