# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Various extensions to the base thread library"
HOMEPAGE="https://github.com/meh/ruby-thread"
LICENSE="WTFPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
