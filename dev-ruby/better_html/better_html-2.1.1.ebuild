# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTENSIONS=(ext/better_html_ext/extconf.rb)
RUBY_FAKEGEM_GEMSPEC="better_html.gemspec"

inherit ruby-fakegem

DESCRIPTION="Better HTML for Rails"
HOMEPAGE="https://github.com/Shopify/better-html"
SRC_URI="https://github.com/Shopify/better-html/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="better-html-${PV}"

LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/actionview-6.0:*
	>=dev-ruby/activesupport-6.0:*
	dev-ruby/ast:0
	>=dev-ruby/erubi-1.4:0
	>=dev-ruby/parser-2.4
	dev-ruby/smart_properties
"

ruby_add_bdepend "test? ( dev-ruby/mocha dev-ruby/railties )"

all_ruby_prepare() {
	# Avoid test that requires bundler and a very specific associated
	# setup.
	rm -rf test/better_html/railtie_test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
