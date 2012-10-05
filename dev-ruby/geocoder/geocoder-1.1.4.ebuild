# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Geocoder is a complete geocoding solution for Ruby."
HOMEPAGE="http://www.rubygeocoder.com/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

ruby_add_bdepend "dev-ruby/test-unit:2"

all_ruby_prepare() {
	# Remove tests for stuff I'm not interested in.
	rm test/mongoid_test.rb || die
}

each_ruby_test() {
	ruby-ng_testrb-2 test/*_test.rb || die
}
