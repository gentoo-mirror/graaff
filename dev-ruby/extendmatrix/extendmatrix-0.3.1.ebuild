# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="History.txt ORIGINAL_README.txt README.txt"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Some enhancements to the Ruby Matrix module"
HOMEPAGE="http://github.com/clbustos/extendmatrix"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_bdepend "doc? ( dev-ruby/hoe )"

all_ruby_prepare() {
	sed -i -e "/require 'spec/ s:^:#:" spec/extendmatrix_spec.rb || die
}
