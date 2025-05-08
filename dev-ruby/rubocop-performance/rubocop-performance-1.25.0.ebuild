# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_GEMSPEC="rubocop-performance.gemspec"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A collection of RuboCop cops to check for performance optimizations in Ruby code"
HOMEPAGE="https://github.com/rubocop/rubocop-performance/"
SRC_URI="https://github.com/rubocop/rubocop-performance/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/lint_roller-1.1:1
	>=dev-ruby/rubocop-1.75.0:0
	>=dev-ruby/rubocop-ast-1.38.0
"

all_ruby_prepare() {
	# Specs fail due to seemingly obsolete configuration.
	rm -f spec/rubocop/cli/autocorrect_spec.rb spec/project_spec.rb || die
}
