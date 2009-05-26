# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="The ReCaptchaClient abstracts the ReCaptcha API for use in Rails Applications"
HOMEPAGE="http://www.bitbucket.org/mml/ruby-recaptcha"
LICENSE="MIT"

USE_RUBY="ruby18"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND=">=dev-ruby/rubygems-1.3.0"
DEPEND="${RDEPEND}"
