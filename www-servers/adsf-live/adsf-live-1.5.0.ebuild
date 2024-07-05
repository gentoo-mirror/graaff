# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Automatically reloads when changes are detected"
HOMEPAGE="https://github.com/denisdefreyne/adsf"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="test"

ruby_add_rdepend "
	>=www-servers/adsf-1.3:0
	>=dev-ruby/em-websocket-0.5:0
	>=dev-ruby/eventmachine-1.2:0
	dev-ruby/listen:3
	>=dev-ruby/rack-livereload-0.3:0
"
