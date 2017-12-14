# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Support library for inflections"
HOMEPAGE="https://github.com/reactormonk/extlib/tree/inflection"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
