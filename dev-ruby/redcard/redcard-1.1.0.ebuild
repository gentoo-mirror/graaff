# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="An API for specifying multiple ruby implementations and versions"
HOMEPAGE="https://github.com/brixen/redcard"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
