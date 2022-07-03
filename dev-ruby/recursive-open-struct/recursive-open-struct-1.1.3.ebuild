# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A collection of RuboCop cops to check for performance optimizations in Ruby code"
HOMEPAGE="https://github.com/aetherknight/recursive-open-struct"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/pry/ s:^:#:' spec/spec_helper.rb || die
}
