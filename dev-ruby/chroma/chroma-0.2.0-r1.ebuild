# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Color manipulation and palette generation"
HOMEPAGE="https://github.com/jfairbank/chroma"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
