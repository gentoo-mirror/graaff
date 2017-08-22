# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Simple OData library"
HOMEPAGE="https://github.com/plainprogrammer/odata"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.2 >=dev-ruby/typhoeus-0.6.8:*"

all_ruby_prepare() {
	sed -i -e '/typhoeus/ s/0.6.8/0.6/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
