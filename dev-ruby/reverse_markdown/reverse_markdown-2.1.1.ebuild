# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Map simple html back into markdown"
HOMEPAGE="https://github.com/xijo/reverse_markdown"
LICENSE="WTFPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend "dev-ruby/nokogiri"

ruby_add_bdepend "test? ( dev-ruby/kramdown )"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/SimpleCov.start/ s:^:#:' spec/spec_helper.rb || die

	sed -e '/raises invalid byte sequence in UTF-8 exception/askip "Raises different exception in 3.2"' \
		-i spec/lib/reverse_markdown_spec.rb || die
}
