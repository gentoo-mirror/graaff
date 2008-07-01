# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

inherit ruby gems

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="http://code.google.com/p/rvideo/"
LICENSE="MIT"

KEYWORDS="amd64 x86"
SLOT="0"
IUSE="flv"

RDEPEND="flv? (media-video/flvtool2)"

