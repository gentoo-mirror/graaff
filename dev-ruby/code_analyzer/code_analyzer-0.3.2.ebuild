# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=4
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Code analyzer helps you build your own code analyzer tool."
HOMEPAGE="https://github.com/flyerhzm/code_analyzer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend "dev-ruby/sexp_processor"
