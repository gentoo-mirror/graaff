# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.markdown README.markdown"

inherit ruby-fakegem

DESCRIPTION="Sass globbing allows you to import many sass or scss files in a single import statement"
HOMEPAGE="http://chriseppstein.github.com/"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/sass-3.1
"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile || die
}
