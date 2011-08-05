# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="NEWS.md README.md"

RUBY_FAKEGEM_TASK_DOC="doc"

inherit ruby-fakegem

DESCRIPTION="Cri is a library for building easy-to-use commandline tools."
HOMEPAGE="http://rubygems.org/gems/cri"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/yard )"
ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
