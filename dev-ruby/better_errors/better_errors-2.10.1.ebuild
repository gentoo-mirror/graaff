# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Provides a better error page for Rails and other Rack apps"
HOMEPAGE="https://github.com/BetterErrors/better_errors"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

# Uses various gemfiles
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/erubi-1.0.0
	>=dev-ruby/rack-0.9.0
	dev-ruby/rouge:*
"
