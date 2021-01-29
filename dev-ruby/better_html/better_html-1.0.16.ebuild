# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="Better HTML for Rails"
HOMEPAGE="https://github.com/Shopify/better-html"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/actionview-4.2:*
	>=dev-ruby/activesupport-4.2:*
	dev-ruby/ast:0
	dev-ruby/erubi:0
	>=dev-ruby/html_tokenizer-0.0.6 =dev-ruby/html_tokenizer-0.0*
	>=dev-ruby/parser-2.4
	dev-ruby/smart_properties
"

ruby_add_bdepend "test? ( dev-ruby/mocha dev-ruby/railties:5.2 )"

all_ruby_prepare() {
	sed -i -e '/mocha/ s/mini_test/minitest/' -e '1i gem "actionview", " ~> 5.2" ; gem "railties", "~> 5.2"' test/test_helper.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
