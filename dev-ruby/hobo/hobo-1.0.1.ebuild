# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="CHANGES.txt README"

RUBY_FAKEGEM_EXTRAINSTALL="dryml_generators rails rails_generators script taglibs tasks"

inherit ruby-fakegem

DESCRIPTION="Hobo is an extension to Ruby on Rails which helps you build web applications quickly and easily."
HOMEPAGE="http://hobocentral.net/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# The Rakefile is broken and tests don't seem to work anyway. Needs more work.
RESTRICT="test"

ruby_add_bdepend "test? ( dev-ruby/activerecord )"

ruby_add_rdepend "~dev-ruby/hobosupport-${PV}
	~dev-ruby/hobofields-${PV}
	>=dev-ruby/rails-2.2.2
	>=dev-ruby/will_paginate-2.3.11"
