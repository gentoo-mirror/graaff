# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.markdown README.textile"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A concise library that connects ActiveRecord to the Sphinx search daemon"
HOMEPAGE="https://freelancing-gods.com/thinking-sphinx/v4/"
LICENSE="MIT"

SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/activerecord-4.2.0:*
	>=dev-ruby/builder-2.1.2:*
	>=dev-ruby/innertube-1.0.2
	>=dev-ruby/joiner-0.3.4:*
	>=dev-ruby/middleware-0.1.0
	>=dev-ruby/riddle-2.3"

# There are specs and features but not all files are present so they
# don't run. We also need additional unpackaged dependencies for this.
