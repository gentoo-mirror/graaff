# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=2

# jruby fails tests, revisit later.
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="rails VERSION VERSION_NAME"

inherit ruby-fakegem

DESCRIPTION="Sass is an extension of CSS3, adding nested rules, variables, mixins, selector inheritance, and more."
HOMEPAGE="http://sass-lang.com/"
LICENSE="MIT"
SRC_URI="mirror://rubygems/sass-3.1.0.alpha.252.gem"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/yard dev-ruby/maruku )"
ruby_add_bdepend "test? ( virtual/ruby-test-unit )"

ruby_add_rdepend "dev-ruby/fssm"
