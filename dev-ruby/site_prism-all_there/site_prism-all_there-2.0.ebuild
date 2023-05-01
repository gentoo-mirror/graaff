# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Simple DSL in order to recursively query page/section/element structures"
HOMEPAGE="https://github.com/site-prism/site_prism-all_there"
LICENSE="BSD"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE="doc"

# Not packaged by default and avoids a circular dependency with site_prism.
RESTRICT="test"
