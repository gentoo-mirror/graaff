# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Rss and Atom feed parser built on top of Nokogiri"
HOMEPAGE="https://github.com/arttu/feed_parser"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

PATCHES=( "${FILESDIR}/${P}-uri-open.patch" )

ruby_add_rdepend "dev-ruby/nokogiri"

all_ruby_prepare() {
	sed -e '28 s|:url => "http://blog.example.com/feed/"|{ url: "http://blog.example.com/feed/" }|' \
		-i spec/feed_parser_spec.rb || die
}
