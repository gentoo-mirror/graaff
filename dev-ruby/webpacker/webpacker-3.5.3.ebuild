# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Use webpack to manage app-like JavaScript modules in Rails"
HOMEPAGE="https://github.com/rails/webpacker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-4.2:*
	>=dev-ruby/rack-proxy-0.6.1
	>=dev-ruby/railties-4.2:*
"

all_ruby_prepare() {
	sed -i -e '/byebug/ s:^:#:' test/test_helper.rb || die
}

each_ruby_test() {
	RUBYLIB="$(pwd)/lib" ${RUBY} -S rake test || die
}
