# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="vendor"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A simple, lightweight JavaScript API for handling cookies"
HOMEPAGE="https://github.com/freego/js_cookie_rails"
LICENSE="MIT"

SLOT="2"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/railties-3.1:*"
