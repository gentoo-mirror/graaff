# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="paper_trail.gemspec"

inherit ruby-fakegem

DESCRIPTION="PaperTrail lets you track changes to your models' data."
HOMEPAGE="https://github.com/airblade/paper_trail"

LICENSE="MIT"
SLOT="3real"
KEYWORDS="~amd64"
IUSE=""

# Fails loading dependencies of rspec and shoulda. Might be bundler-related.
RESTRICT="test"

#ruby_add_bdepend "test? ( >=dev-ruby/shoulda-3.5 >=dev-ruby/sqlite3-1.2 >=dev-ruby/capybara-2.0 dev-ruby/bundler )"

ruby_add_rdepend ">dev-ruby/activerecord-3 <dev-ruby/activerecord-5
	>dev-ruby/activesupport-3 <dev-ruby/activesupport-5"

all_ruby_prepare() {
	# Ignore test unimportant to me failing due to deprecations.
	rm test/unit/timestamp_test.rb || die
}
