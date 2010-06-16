# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES.txt README.txt"

RUBY_FAKEGEM_EXTRAINSTALL="rails rails_generators script"

inherit ruby-fakegem

DESCRIPTION="Rich field types and migration-generator for Rails."
HOMEPAGE="http://hobocentral.net/hobofields"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activerecord )"

ruby_add_rdepend "~dev-ruby/hobosupport-${PV} >=dev-ruby/rails-2.2.2"

each_ruby_test() {
	# Rakefile is broken since it tests the currently installed
	# version instead of the version in the current directory.
	${RUBY} test/test_hobofield_model_generator.rb
}
