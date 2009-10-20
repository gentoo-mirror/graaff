# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="Ruby/CAPTCHA is an implementation of the 'Completely Automated Public Turing Test to Tell Computers and Humans Apart'."
HOMEPAGE="http://captcha.rubyforge.org/"
LICENSE="MIT"

KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""

USE_RUBY="ruby18"
DEPEND=">=dev-ruby/ruby-gd-0.7.4
	virtual/ruby"
RDEPEND="${DEPEND}"
