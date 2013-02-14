# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="readme.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="stylesheets"

inherit ruby-fakegem

DESCRIPTION="Sass mixin that calculates incremental values of the modular scale in proportion to a size and ratio"
HOMEPAGE="http://compass-style.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/compass-0.11.5 >=dev-ruby/sass-3.2.0 >=dev-ruby/sassy-math-1.5"
