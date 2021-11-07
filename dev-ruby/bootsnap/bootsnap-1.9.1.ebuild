# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTENSIONS=(ext/bootsnap/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR=lib/bootsnap

inherit ruby-fakegem

DESCRIPTION="Boot large ruby/rails apps faster"
HOMEPAGE="https://github.com/Shopify/bootsnap"
SRC_URI="https://github.com/Shopify/bootsnap/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "
	dev-ruby/msgpack:0
"

ruby_add_bdepend "test? ( dev-ruby/bundler dev-ruby/minitest:5 >=dev-ruby/mocha-1.2:1.0 )"

all_ruby_prepare() {
	sed -e '/rake-compiler/ s:^:#:' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -i -e '/\(byebug\|rubocop\)/ s:^:#:' Gemfile || die
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'Dir["test/**/*_test.rb"].each{|f| require f}' || die
}
