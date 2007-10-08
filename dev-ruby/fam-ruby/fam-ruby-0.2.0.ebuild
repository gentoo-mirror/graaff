# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit ruby

# This package uses three different names which makes it imposible to
# install the gem for it. In fact the gem doesn't even install using
# rubygems. The .tar.gz gives us less trouble, fortunately.

DESCRIPTION="FAM bindings for Ruby"
HOMEPAGE="http://www.pablotron.org/software/fam-ruby/"
LICENSE="PaulDuncan"

SRC_URI="http://www.pablotron.org/files/fam-ruby-${PV}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"
DEPEND="virtual/ruby virtual/fam"


