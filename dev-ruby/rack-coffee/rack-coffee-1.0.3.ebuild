# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="Readme.mkdn"

inherit ruby-fakegem

DESCRIPTION="Rack Middlware for compiling and serving .coffee files"
HOMEPAGE="https://github.com/mattly/rack-coffee"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rack dev-ruby/coffee-script"
