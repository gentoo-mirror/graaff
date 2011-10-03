# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="HISTORY README TODO"
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRAINSTALL="tasks"

inherit ruby-fakegem

DESCRIPTION="A set of rake tasks that make it easy to generate metrics reports."
HOMEPAGE="http://metric-fu.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend ">=dev-ruby/rspec-1.3.0:0
	>=dev-ruby/test-construct-1.2.0
	dev-ruby/googlecharts"

ruby_add_rdepend ">=dev-ruby/flay-1.2.1
	>=dev-ruby/activesupport-2.0.0
	>=dev-ruby/flog-2.3.0
	>=dev-ruby/rcov-0.9
	>=dev-ruby/chronic-0.3.0
	>=dev-ruby/churn-0.0.7
	>=dev-ruby/saikuro-1.1.0
	>=dev-ruby/activesupport-2.2.3
	>=dev-ruby/rails_best_practices-0.6.4
	>=dev-ruby/reek-1.2.6
	>=dev-ruby/roodi-2.1.0
	dev-ruby/syntax"

each_ruby_prepare() {
	# Create a directory needed by specs but not always created in time.
	mkdir -p tmp/metric_fu/output || die
}
