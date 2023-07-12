# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Support library for inflections"
HOMEPAGE="https://github.com/reactormonk/extlib/tree/inflection"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
