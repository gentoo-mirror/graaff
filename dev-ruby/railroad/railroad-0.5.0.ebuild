# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/radiant/radiant-0.5.2.ebuild,v 1.2 2007/02/04 16:46:03 graaff Exp $

inherit gems

USE_RUBY="ruby18"
DESCRIPTION="A DOT diagram generator for Ruby on Rail applications"
HOMEPAGE="http://railroad.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/ruby-1.8.4"
RDEPEND="media-gfx/graphviz"
