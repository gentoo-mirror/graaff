# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A simple PO file to ruby hash parser"
HOMEPAGE="https://github.com/experteer/simple_po_parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -i -e '/\(simplecov\|coveralls\|awesome_print\)/ s:^:#: ; /SimpleCov.formatter/,/^end/ s:^:#: ; 1irequire "pathname"' spec/spec_helper.rb || die
}
