# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="paper_trail.gemspec"

inherit ruby-fakegem

DESCRIPTION="PaperTrail lets you track changes to your models' data."
HOMEPAGE="https://github.com/paper-trail-gem/paper_trail"
SRC_URI="https://github.com/paper-trail-gem/paper_trail/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT=$(ver_cut 1)
KEYWORDS="~amd64"
IUSE=""

# Now uses appraisal which we don't support yet.
RESTRICT="test"

#ruby_add_bdepend "test? ( >=dev-ruby/shoulda-3.5 >=dev-ruby/sqlite3-1.2 >=dev-ruby/capybara-2.0 dev-ruby/bundler )"

ruby_add_rdepend "
	>dev-ruby/activerecord-6.0:*
	>=dev-ruby/request_store-1.4:0
"

all_ruby_prepare() {
	rm -f Gemfile.lock || die

	# Ignore test unimportant to me failing due to deprecations.
	rm -f test/unit/timestamp_test.rb || die
}
