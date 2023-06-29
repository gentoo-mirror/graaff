# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTENSIONS=(ext/better_html_ext/extconf.rb)
RUBY_FAKEGEM_GEMSPEC="better_html.gemspec"

inherit ruby-fakegem

DESCRIPTION="Better HTML for Rails"
HOMEPAGE="https://github.com/Shopify/better-html"
SRC_URI="https://github.com/Shopify/better-html/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="better-html-${PV}"

LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/actionview-6.0:*
	>=dev-ruby/activesupport-6.0:*
	dev-ruby/ast:0
	>=dev-ruby/erubi-1.4:0
	>=dev-ruby/parser-2.4
	dev-ruby/smart_properties
"

ruby_add_bdepend "test? ( dev-ruby/mocha dev-ruby/railties:7.0 )"

all_ruby_prepare() {
	sed -e '/mocha/ s/mini_test/minitest/' -e '1i gem "actionview", " ~> 7.0.0" ; gem "railties", "~> 7.0.0"' \
		-i test/test_helper.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
