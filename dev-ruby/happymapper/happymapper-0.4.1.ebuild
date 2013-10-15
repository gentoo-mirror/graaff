# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_GEMSPEC="happymapper.gemspec"

inherit ruby-fakegem

DESCRIPTION="Object to xml mapping library."
HOMEPAGE="http://github.com/jnunemaker/happymapper/"
SRC_URI="https://github.com/jnunemaker/happymapper/tarball/v${PV} -> ${P}.tgz"
RUBY_S="jnunemaker-happymapper-*"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"
ruby_add_rdepend ">=dev-ruby/libxml-2.0.0"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' Rakefile spec/spec_helper.rb || die
	sed -i -e "s/'spec'/'rspec'/" spec/spec_helper.rb || die
}
