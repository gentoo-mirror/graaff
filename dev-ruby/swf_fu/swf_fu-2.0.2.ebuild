# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="With the swf_fu plugin, rails treats your swf files like any other asset."
HOMEPAGE="https://github.com/marcandre/swf_fu"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Bundler madness and depends on newer shoulda-context, not yet packaged.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/coffee-script >=dev-ruby/rails-3.1"
