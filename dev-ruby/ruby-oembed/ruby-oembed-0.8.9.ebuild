# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="An oEmbed consumer library written in Ruby."
HOMEPAGE="https://github.com/judofyr/ruby-oembed"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

ruby_add_bdepend "test?
	(
		dev-ruby/json
		dev-ruby/vcr:1
		dev-ruby/xml-simple
		dev-ruby/nokogiri
		dev-ruby/fakeweb
	)"

all_ruby_prepare() {
	# Remove bundler
	rm Gemfile || die
}
