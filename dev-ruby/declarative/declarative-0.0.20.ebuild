# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

inherit ruby-fakegem

DESCRIPTION="DSL for nested generic schemas with inheritance and refining"
HOMEPAGE="https://github.com/apotonick/declarative"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
