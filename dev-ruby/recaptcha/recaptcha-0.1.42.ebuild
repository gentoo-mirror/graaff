# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit gems

DESCRIPTION="The ReCaptchaClient abstracts the ReCaptcha API for use in Rails Applications"
HOMEPAGE="http://www.loonsoft.com/recaptcha/"
LICENSE="MIT"

# The URL depends implicitly on the version, unfortunately. Even if you
# change the filename on the end, it still downloads the same file.
SRC_URI="http://www.loonsoft.com/recaptcha/pkg/gems/${P}.gem"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

