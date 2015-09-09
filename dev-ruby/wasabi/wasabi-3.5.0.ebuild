# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A simple WSDL parser"
HOMEPAGE="https://github.com/savonrb/wasabi"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "dev-ruby/httpi:0 >=dev-ruby/nokogiri-1.4.2"

all_ruby_prepare() {
	sed -i -e '/bundler/,/^end/ s:^:#:' \
		-e '1i require "httpi"; require "wasabi"' spec/spec_helper.rb || die
}
