# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="Provides a dev bar and an overlay to visualize your UI's rendered partials"
HOMEPAGE="https://github.com/brentd/xray-rails"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

# Uses various gemfiles
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/rails-3.1.0:*
"
