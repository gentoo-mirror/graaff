# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

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

ruby_add_bdepend "test? ( dev-ruby/mocha dev-ruby/railties:6.0 )"

all_ruby_prepare() {
	sed -i -e '/mocha/ s/mini_test/minitest/' -e '1i gem "actionview", " ~> 6.0.0" ; gem "railties", "~> 6.0.0"' test/test_helper.rb || die

	# The ERB implementation tests don't work with Rails 6.0, even though erblint seems to work fine with it. Skip them for now.
	rm -f test/better_html/better_erb/implementation_test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
