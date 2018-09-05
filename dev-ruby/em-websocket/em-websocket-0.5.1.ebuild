# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit eapi7-ver ruby-fakegem

DESCRIPTION="EventMachine based WebSocket server"
HOMEPAGE="https://github.com/igrigorik/em-websocket"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/eventmachine-0.12.9
	=dev-ruby/http_parser_rb-0.6*
"
