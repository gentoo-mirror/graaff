# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

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

ruby_add_bdepend "test? ( dev-ruby/rspec:0 dev-ruby/stale_fish )"

ruby_add_rdepend ">=dev-ruby/rest-client-1.6.0
	>=dev-ruby/nokogiri-1.4.3.1
	>=dev-ruby/happymapper-0.3.2
	dev-ruby/builder"

all_ruby_prepare() {
	rm Gemfile || die
}
