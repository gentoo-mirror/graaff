# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="none"

RUBY_FAKEGEM_EXTRADOC="History.txt README.md"

inherit linux-info ruby-fakegem

DESCRIPTION="An easy to configure, easy to extend monitoring framework written in Ruby"
HOMEPAGE="http://godrb.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="event"

CONFIG_CHECK="CONNECTOR"

pkg_setup() {
	if use event ; then
		linux-info_pkg_setup
	fi
}

all_ruby_prepare() {
	# Avoid tests for unpackaged dependencies
	rm -f test/test_{statsd,prowl,airbrake,jabber}.rb || die
}

each_ruby_configure() {
	if use event ; then
		${RUBY} -Cext/god extconf.rb || die
	fi
}

each_ruby_compile() {
	if use event ; then
		emake V=1 -Cext/god
		cp ext/god/netlink_handler_ext.so lib/ || die
	fi
}

all_ruby_install() {
	all_fakegem_install

	keepdir /etc/god

	newinitd "${FILESDIR}"/init-d-1 god
}
