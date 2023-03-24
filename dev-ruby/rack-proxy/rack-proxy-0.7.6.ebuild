# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Rack app providing request/response rewriting proxy capabilities with streaming"
HOMEPAGE="https://github.com/ncr/rack-proxy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# All tests work against live services
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/rack:*
"
