# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A complete implementation of the WebSocket protocols"
HOMEPAGE="https://github.com/faye/websocket-driver"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/websocket_mask extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/websocket_mask
	cp ext/websocket_mask/websocket_mask.so lib/ || die
}
