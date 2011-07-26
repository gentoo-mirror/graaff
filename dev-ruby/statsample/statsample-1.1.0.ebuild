# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="README.txt"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Making YAML easy and fun to use with Ruby"
HOMEPAGE="http://www.metabates.com"
LICENSE="GPL-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend "
	dev-ruby/dirty-memoize
	>=dev-ruby/distribution-0.3
	>=dev-ruby/extendmatrix-0.3.1
	dev-ruby/fastercsv"

#  minimization (~> 0.2.0, runtime)
#  reportbuilder (~> 1.4, runtime)
#  rserve-client (~> 0.2.5, runtime)
#  spreadsheet (~> 0.6.5, runtime)
#  statsample-bivariate-extension (> 0, runtime)
#  rubyvis (~> 0.4.0, runtime)

#  gettext (~> 0, development)
#  hoe (~> 0, development)
#  hoe (>= 2.9.0, development)
#  hoe-git (~> 0, development)
#  minitest (~> 2.0, development)
#  mocha (~> 0, development)
#  rserve-client (~> 0, development)
#  shoulda (~> 0, development)

all_ruby_prepare() {
	# Nasty hack to avoid adding a bunch of dependencies I don't need now...
	sed -i -e '/reportbuilder/d' lib/statsample.rb || die
}
