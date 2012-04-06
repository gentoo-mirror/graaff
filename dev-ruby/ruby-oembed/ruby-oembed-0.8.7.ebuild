# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=3
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="An oEmbed consumer library written in Ruby."
HOMEPAGE="https://github.com/judofyr/ruby-oembed"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="test"

ruby_add_bdepend "test?
	(
		dev-ruby/jeweler
		dev-ruby/rspec:2
		dev-ruby/json
		dev-ruby/xml-simple
	)"

all_ruby_prepare() {
	# Remove bundler
	rm Gemfile Gemfile.lock || die
}

each_ruby_test() {
	${RUBY} -S rspec spec || die
}
