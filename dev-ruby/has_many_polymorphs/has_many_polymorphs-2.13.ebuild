# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README TODO"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb generators"

inherit ruby-fakegem

DESCRIPTION="An ActiveRecord plugin for self-referential and double-sided polymorphic associations."
HOMEPAGE="https://github.com/fauna/has_many_polymorphs"
LICENSE="AFL-3.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Tests depend on various rails versions. Skip for now since this is
# hard to set up.
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/echoe )
	test? ( dev-ruby/echoe )"
ruby_add_rdepend "dev-ruby/activerecord"
