# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Bundle and transpile JavaScript in Rails with esbuild, rollup.js, or Webpack"
HOMEPAGE="https://github.com/rails/jsbundling-rails"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/railties-6.0.0:*"
