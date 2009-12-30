# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="HISTORY README TODO"

# Skip specs for now. They require 'construct' but it is not clear
# which package provides this in a way that satifies metric_fu.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="tasks"

inherit ruby-fakegem

DESCRIPTION="A set of rake tasks that make it easy to generate metrics reports."
HOMEPAGE="http://metric-fu.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/flay-1.2.1
	>=dev-ruby/flog-2.2.0
	>=dev-ruby/rcov-0.9
	dev-ruby/chronic"
