# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README.md"

# Tests require a running beanstalk daemon.
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="This is a Ruby client library for the Beanstalk protocol."
HOMEPAGE="http://beanstalk.rubyforge.org/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
