# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-capybara.gemspec"

inherit ruby-fakegem

DESCRIPTION="Code style checking for RSpec files"
HOMEPAGE="https://github.com/rubocop/rubocop-capybara"
SRC_URI="https://github.com/rubocop/rubocop-capybara/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/lint_roller-1.1.0:1
	=dev-ruby/rubocop-1* >=dev-ruby/rubocop-1.72.1
"

ruby_add_depend "test? ( dev-ruby/bundler dev-ruby/yard )"

all_ruby_prepare() {
	sed -e '/\(bump\|danger\|rubocop\|simplecov\)/ s:^:#:' \
		-i Gemfile || die
	rm -f tasks/cut_release.rake || die
	sed -e '/format/d' \
		-i .rspec || die
}

each_ruby_test() {
	NO_COVERAGE=true ${RUBY} -S rake spec || die
}
