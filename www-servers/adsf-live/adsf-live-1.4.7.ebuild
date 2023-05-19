# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Automatically reloads when changes are detected"
HOMEPAGE="https://github.com/denisdefreyne/adsf"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "
	>=www-servers/adsf-1.3:0
	>=dev-ruby/em-websocket-0.5:0
	>=dev-ruby/eventmachine-1.2:0
	dev-ruby/listen:3
	>=dev-ruby/rack-livereload-0.3:0
"
