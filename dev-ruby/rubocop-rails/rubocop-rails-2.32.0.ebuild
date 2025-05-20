# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-rails.gemspec"

inherit ruby-fakegem

DESCRIPTION="A collection of RuboCop cops to check for performance optimizations in Ruby code"
HOMEPAGE="https://github.com/rubocop/rubocop-rails/"
SRC_URI="https://github.com/rubocop/rubocop-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/activesupport-4.2.0:*
	>=dev-ruby/lint_roller-1.1.0:1
	>=dev-ruby/rack-1.1:*
	>=dev-ruby/rubocop-1.75.0 =dev-ruby/rubocop-1*
	>=dev-ruby/rubocop-ast-1.44.0:1
"

ruby_add_depend "test? ( dev-ruby/bundler dev-ruby/rubocop-performance )"

all_ruby_prepare() {
	sed -e '/\(bump\|simplecov\|test-queue\)/ s:^:#:' \
		-e '/rubocop/ s/,.*$//' \
		-i Gemfile || die
	rm -f tasks/cut_release.rake || die
}

each_ruby_prepare() {
	sed -e "s:rspec-queue:${RUBY} -S rspec:" \
		-i Rakefile || die
}

each_ruby_test() {
	${RUBY} -S rake spec || die
}
