# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

inherit ruby-fakegem

DESCRIPTION="DSL for nested generic schemas with inheritance and refining"
HOMEPAGE="https://github.com/apotonick/declarative"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
