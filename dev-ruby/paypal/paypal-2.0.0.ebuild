# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit ruby gems

DESCRIPTION="Library aiding with Paypal IPN from web applications."
HOMEPAGE="http://rubyforge.org/projects/paypal/"
LICENSE="Ruby"

# The URL depends implicitly on the version, unfortunately. Even if you
# change the filename on the end, it still downloads the same file.
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

KEYWORDS="~ia64 ~x86 ~amd64"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"
DEPEND="virtual/ruby
	dev-ruby/money"
