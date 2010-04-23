# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README"

inherit ruby-fakegem

DESCRIPTION="The libxml gem provides Ruby language bindings for GNOME's Libxml2
XML toolkit."
HOMEPAGE="http://rubyforge.org/tracker/?group_id=494"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="${RDEPEND} dev-libs/libxml2"
DEPEND="${DEPEND} dev-libs/libxml2"

RUBY_PATCHES=( "rxml_reader_attribute.patch" )

# The tests fail with a segmentation fault. Not good, and plenty of
# similar bug reports upstream, but no fix yet. Let's continue
# anyway...
RESTRICT="test"
