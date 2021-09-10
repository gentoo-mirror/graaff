# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

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
