# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Generates Rails model and controller UML diagrams"
HOMEPAGE="https://github.com/preston/railroady"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-gfx/graphviz"

# Fails tests in a weird way, to be investigated later
RESTRICT="test"

ruby_add_bdepend "test? ( dev-ruby/activesupport )"
