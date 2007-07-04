# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit ruby gems

DESCRIPTION="test/spec layers an RSpec-inspired interface on top of Test::Unit, so you can mix TDD and BDD"
HOMEPAGE="http://test-spec.rubyforge.org/test-spec/"
LICENSE="Ruby"

SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"
DEPEND=">=dev-lang/ruby-1.8"
