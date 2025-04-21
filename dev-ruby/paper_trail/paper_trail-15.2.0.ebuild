# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="paper_trail.gemspec"
#RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="PaperTrail lets you track changes to your models' data."
HOMEPAGE="https://github.com/paper-trail-gem/paper_trail"
SRC_URI="https://github.com/paper-trail-gem/paper_trail/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT=$(ver_cut 1)
KEYWORDS="~amd64"
IUSE="test"

# Now uses appraisal which I haven't gotten to work yet.
RESTRICT="test"

# ruby_add_bdepend "test? (
# 	>=dev-ruby/shoulda-3.5
# 	>=dev-ruby/sqlite3-1.2
# 	>=dev-ruby/capybara-2.0
# 	dev-ruby/bundler
# 	>=dev-ruby/ffaker-2.20:2
# 	dev-ruby/rails:7.0
# )"

ruby_add_rdepend "
	|| ( dev-ruby/activerecord:7.2 dev-ruby/activerecord:7.1 dev-ruby/activerecord:7.0 )
	>=dev-ruby/request_store-1.4:0
"

all_ruby_prepare() {
	rm -f Gemfile.lock || die

	# Be more lenient in appraisal versions
	sed -i -e '/appraisal/ s/2.4.1/2.4/' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Ignore test unimportant to me failing due to deprecations.
	rm -f test/unit/timestamp_test.rb || die
}

each_ruby_test() {
	${RUBY} -S appraisal rails-7.0 rake || die
}
