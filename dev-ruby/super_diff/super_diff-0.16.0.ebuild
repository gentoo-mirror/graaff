# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="super_diff.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Hooks into RSpec to display the differences between two data structures"
HOMEPAGE="https://github.com/splitwise/super_diff"
SRC_URI="https://github.com/splitwise/super_diff/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# Tests use appraisals with gemfiles that would need to be adjusted for
# the subset that we need for testing.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/attr_extras-6.2.4
	dev-ruby/diff-lcs
	dev-ruby/patience_diff
"

ruby_add_bdepend "test? (
	dev-ruby/activerecord[sqlite]
	dev-ruby/appraisal
	dev-ruby/climate_control
)"
