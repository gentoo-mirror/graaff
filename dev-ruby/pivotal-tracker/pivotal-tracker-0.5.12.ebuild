# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="Ruby gem that provides an AR-style interface for the Pivotal Tracker API."
HOMEPAGE="http://github.com/jsmestad/pivotal-tracker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test" # Broken right now due to bad ruby syntax. Should fix.

ruby_add_bdepend "test? ( dev-ruby/rspec:0 >=dev-ruby/stale_fish-1.3.0 )"

ruby_add_rdepend ">=dev-ruby/rest-client-1.6.0
	>=dev-ruby/nokogiri-1.5.5
	>=dev-ruby/happymapper-0.3.2
	>=dev-ruby/nokogiri-happymapper-0.5.4
	dev-ruby/crack
	dev-ruby/builder"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' spec/spec_helper.rb || die
}
