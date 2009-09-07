# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

DESCRIPTION="Roodi stands for Ruby Object Oriented Design Inferometer"
HOMEPAGE="http://rubyforge.org/projects/roodi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

USE_RUBY="ruby18"

DEPEND="dev-ruby/ruby_parser"
RDEPEND="${DEPEND}"
