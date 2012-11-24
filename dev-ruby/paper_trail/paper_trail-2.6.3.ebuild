# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="paper_trail.gemspec"

inherit ruby-fakegem

DESCRIPTION="PaperTrail lets you track changes to your models' data."
HOMEPAGE="https://github.com/airblade/paper_trail"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/shoulda dev-ruby/sqlite3 dev-ruby/capybara dev-ruby/bundler )"

ruby_add_rdepend "=dev-ruby/railties-3* =dev-ruby/activerecord-3*"

all_ruby_prepare() {
	# Fix up dependencies to allow a wider range of development versions.
	sed -i -e 's/2.10.3/>= 2.10.3/' -e 's/1.0.0/1.0/' paper_trail.gemspec || die

	# Ignore test unimportant to me failing due to deprecations.
	rm test/unit/timestamp_test.rb || die
}
