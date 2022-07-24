# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="misc"

RUBY_FAKEGEM_GEMSPEC="premailer.gemspec"

inherit ruby-fakegem

DESCRIPTION="Improve the rendering of HTML emails"
HOMEPAGE="https://github.com/premailer/premailer"
SRC_URI="https://github.com/premailer/premailer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="1"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/addressable
	>=dev-ruby/css_parser-1.6.0
	>=dev-ruby/htmlentities-4.0.0
	dev-ruby/nokogiri
"

ruby_add_bdepend "
	test? ( dev-ruby/maxitest dev-ruby/webmock )
"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' test/helper.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'gem "psych", "~> 3.0"; Dir["test/test_*.rb"].each{|f| require f}' || die
}
