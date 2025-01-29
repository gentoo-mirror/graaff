# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="language_server-protocol.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Language Server Protocol SDK"
HOMEPAGE="https://github.com/mtsmfm/language_server-protocol-ruby"
SRC_URI="https://github.com/mtsmfm/language_server-protocol-ruby/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="language_server-protocol-ruby-${PV}"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

# Requires bundler and additional unpackaged dependencies and a javascript LSP server
RESTRICT="test"
