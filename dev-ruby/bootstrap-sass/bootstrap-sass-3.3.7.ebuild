# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Sass-powered version of Bootstrap 3"
HOMEPAGE="https://github.com/twbs/bootstrap-sass"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="3"
IUSE=""

# Requires bundler setup for rails project to test with
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/autoprefixer-rails-5.2.1
	>=dev-ruby/sass-3.3.4:*
"

all_ruby_prepare() {
	sed -i -e '/reporters/I s:^:#:' \
		-e '/bundler/ s:^:#:' test/test_helper.rb || die
}
