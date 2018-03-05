# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="HISTORY README.textile"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A concise library that connects ActiveRecord to the Sphinx search daemon"
HOMEPAGE="http://freelancing-god.github.com/ts/en/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="3.4"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.1.0:*
	>=dev-ruby/builder-2.1.2:*
	>=dev-ruby/innertube-1.0.2
	>=dev-ruby/joiner-0.2.0:*
	>=dev-ruby/middleware-0.1.0
	>=dev-ruby/riddle-2.0.0"

# There are specs and features but not all files are present so they
# don't run. We also need additional unpackaged dependencies for this.
