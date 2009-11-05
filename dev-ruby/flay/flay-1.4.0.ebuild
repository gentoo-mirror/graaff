# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="Flay analyzes code for structural similarities."
HOMEPAGE="http://ruby.sadi.st/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"

DEPEND="=dev-ruby/sexp-processor-3.0*
	=dev-ruby/ruby_parser-2.0*"
RDEPEND="${DEPEND}"
