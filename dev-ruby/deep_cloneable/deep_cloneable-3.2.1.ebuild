# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md readme.md"

RUBY_FAKEGEM_GEMSPEC="deep_cloneable.gemspec"

inherit ruby-fakegem

DESCRIPTION="Extends the functionality of ActiveRecord::Base#dup to perform a deep clone"
HOMEPAGE="https://github.com/moiristo/deep_cloneable"
SRC_URI="https://github.com/moiristo/deep_cloneable/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/activerecord-3.1:*"

ruby_add_bdepend "test? ( >=dev-ruby/activerecord-3.1:*[sqlite] )"

all_ruby_prepare() {
	sed -i -e '/\(appraisal\|bundler\)/ s:^:#:' Rakefile || die

	sed -e 's/MiniTest::Unit::TestCase/Minitest::Test/' -i test/test_deep_cloneable.rb || die
}
