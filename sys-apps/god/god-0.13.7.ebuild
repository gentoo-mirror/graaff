# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="none"

RUBY_FAKEGEM_EXTRADOC="History.txt README.md"

inherit ruby-fakegem

DESCRIPTION="An easy to configure, easy to extend monitoring framework written in Ruby"
HOMEPAGE="http://godrb.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	# Avoid tests for unpackaged dependencies
	rm -f test/test_{statsd,prowl,airbrake,jabber}.rb || die
}

each_ruby_configure() {
	${RUBY} -Cext/god extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/god
	cp ext/god/netlink_handler_ext.so lib/ || die
}
