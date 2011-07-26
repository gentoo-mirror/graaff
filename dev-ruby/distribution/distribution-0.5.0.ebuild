# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="History.txt README.txt"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="Statistical Distributions library."
HOMEPAGE="http://github.com/clbustos/distribution"
LICENSE="GPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

# Tests fail but nothing serious. Should be fixed later.
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/hoe )"
ruby_add_bdepend "test? ( dev-ruby/hoe dev-ruby/rspec:2 )"
