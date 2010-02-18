# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Templater is a Ruby framework for building code generators."
HOMEPAGE="http://github.com/jnicklas/templater"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend test ">=dev-ruby/rspec-1.2.8"

#ruby_add_bdepend ">=dev-ruby/extlib-0.9.5"

ruby_add_rdepend ">=dev-ruby/highline-1.4.0
	>=dev-ruby/diff-lcs-1.1.2
	>=dev-ruby/extlib-0.9.5"

each_ruby_test() {
	${RUBY} -S spec spec
}
