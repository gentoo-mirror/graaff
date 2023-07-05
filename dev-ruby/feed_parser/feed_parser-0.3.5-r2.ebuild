# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Rss and Atom feed parser built on top of Nokogiri"
HOMEPAGE="https://github.com/arttu/feed_parser"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

PATCHES=( "${FILESDIR}/${P}-uri-open.patch" )

ruby_add_rdepend "dev-ruby/nokogiri"

all_ruby_prepare() {
	sed -e '28 s|:url => "http://blog.example.com/feed/"|{ url: "http://blog.example.com/feed/" }|' \
		-i spec/feed_parser_spec.rb || die
}
