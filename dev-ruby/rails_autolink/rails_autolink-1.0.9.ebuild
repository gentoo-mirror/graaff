# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="This is an extraction of the auto_link method from rails."
HOMEPAGE="http://github.com/tenderlove/rails_autolink"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

ruby_add_bdepend "doc? ( dev-ruby/hoe >=dev-ruby/rdoc-3.10 )
	test? ( dev-ruby/hoe dev-ruby/minitest )"

ruby_add_rdepend ">=dev-ruby/rails-3.1"
