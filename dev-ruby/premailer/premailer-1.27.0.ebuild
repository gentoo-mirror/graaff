# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="misc"

RUBY_FAKEGEM_GEMSPEC="premailer.gemspec"

inherit ruby-fakegem

DESCRIPTION="Improve the rendering of HTML emails"
HOMEPAGE="https://github.com/premailer/premailer"
SRC_URI="https://github.com/premailer/premailer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/addressable
	>=dev-ruby/css_parser-1.19.0
	>=dev-ruby/htmlentities-4.0.0
	>=dev-ruby/nokogiri-1.16
"

ruby_add_bdepend "
	test? ( dev-ruby/maxitest dev-ruby/webmock )
"

all_ruby_prepare() {
	sed -e 's/git ls-files/find/' -i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '/bundler/ s:^:#:' test/helper.rb || die

	# Avoid test broken by recent nokogiri/libxml2 output, already fixed
	# upstream.
	sed -e '/test_special_characters_nokogiri/askip "Broken with newer nokogiri versions"' \
		-i test/test_premailer.rb || die

	# Avoid tests with invalid CSS, most likely due to nokogiri changes.
	sed -e '/test_invalid_css/askip "No longer triggers ArgumentError"' \
		-i test/test_premailer.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'Dir["test/test_*.rb"].each{|f| require f}' || die
}
