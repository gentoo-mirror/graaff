# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="Measure YARD documentation coverage"
HOMEPAGE="https://github.com/dkubb/yardstick"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/yard-0.8.7.2
"

# Weird failures and possibly missing dependency?
RESTRICT="test"
