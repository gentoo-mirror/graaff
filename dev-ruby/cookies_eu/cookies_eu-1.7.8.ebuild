# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="app config"

inherit ruby-fakegem

DESCRIPTION="Displays a cookie consent"
HOMEPAGE="https://github.com/infinum/cookies_eu"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "=dev-ruby/js_cookie_rails-2.2*"
