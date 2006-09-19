# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/gruff/gruff-0.1.1.ebuild,v 1.4 2006/04/17 23:17:59 caleb Exp $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="A no-fluff, open source content management system"
HOMEPAGE="http://radiantcms.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="test"

DEPEND=">=dev-lang/ruby-1.8.4
	=dev-ruby/rails-1.1.6
	dev-ruby/bluecloth
	dev-ruby/redcloth
	dev-ruby/radius
	dev-ruby/rmagick"
