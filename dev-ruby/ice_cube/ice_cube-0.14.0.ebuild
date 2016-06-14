# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

inherit ruby-fakegem

DESCRIPTION="a recurring date library for Ruby"
HOMEPAGE="http://seejohnrun.github.com/ice_cube/"
SRC_URI="https://github.com/seejohnrun/ice_cube/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	sed -i -e 's/@example/example/' spec/spec_helper.rb || die
	rm -r .rspec || die
}

each_ruby_test() {
	TZ=utc ruby-ng_rspec || die
}
