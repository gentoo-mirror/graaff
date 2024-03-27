# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="misc"

RUBY_FAKEGEM_GEMSPEC="premailer.gemspec"

inherit ruby-fakegem

DESCRIPTION="Improve the rendering of HTML emails"
HOMEPAGE="https://github.com/premailer/premailer"
SRC_URI="https://github.com/premailer/premailer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/addressable
	>=dev-ruby/css_parser-1.12.0
	>=dev-ruby/htmlentities-4.0.0
	>=dev-ruby/nokogiri-1.16
"

ruby_add_bdepend "
	test? ( dev-ruby/maxitest dev-ruby/webmock )
"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' test/helper.rb || die

	# Avoid test broken by recent nokogiri/libxml2 output, already fixed
	# upstream.
	sed -e '/test_special_characters_nokogiri/askip "Broken with newer nokogiri versions"' \
		-i test/test_premailer.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'Dir["test/test_*.rb"].each{|f| require f}' || die
}
