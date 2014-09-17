# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRAINSTALL="data config"

inherit ruby-fakegem

DESCRIPTION="Configurable tool for writing clean and consistent SCSS"
HOMEPAGE="https://github.com/causes/scss-lint"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Rspec 3.x
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/rainbow:2
	>=dev-ruby/sass-3.3.7:3.3
"

ruby_add_bdepend "
	test? ( dev-ruby/nokogiri )
"

all_ruby_prepare() {
	sed -e '1igem "sass", "~> 3.3.7"' -i spec/spec_helper.rb || die
}
