# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby30 ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_EXTRAINSTALL="bot_exceptions.yml bots.yml languages.yml search_engines.yml"

inherit ruby-fakegem

DESCRIPTION="Do some browser detection with Ruby"
HOMEPAGE="https://github.com/fnando/browser"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "dev-ruby/rails test? ( dev-ruby/minitest-utils )"

all_ruby_prepare() {
	sed -i -e '/\(autotest\|pry\|rubocop\|simplecov\)/ s:^:#:' browser.gemspec || die
	sed -i -e '/rubocop/,/^end/ s:^:#:' Rakefile || die
	sed -i -e '/simplecov/I s:^:#:' test/test_helper.rb || die
}
