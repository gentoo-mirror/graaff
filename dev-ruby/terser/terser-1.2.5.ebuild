# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

# There are specs but building the gem involves handling git submodules so we skip that for now.
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Terser minifies JavaScript files by wrapping TerserJS to be accessible in Ruby"
HOMEPAGE="https://github.com/ahorek/terser-ruby"
LICENSE="MIT"

SLOT="1"
KEYWORDS="~amd64"

ruby_add_rdepend "=dev-ruby/execjs-2*"
