# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.textile"

inherit ruby-fakegem

DESCRIPTION="A concise and easy-to-use Ruby library that connects ActiveRecord to the Sphinx search daemon."
HOMEPAGE="http://freelancing-god.github.com/ts/en/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="1"
IUSE=""

ruby_add_rdepend "dev-ruby/activerecord:3.0
	>=dev-ruby/riddle-1.3.3:1.3"

# There are specs and features but not all files are present so they
# don't run.
