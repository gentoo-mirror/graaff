# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="API wrapper for Exact Online"
HOMEPAGE="https://github.com/exactonline/exactonline-api-ruby-client"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend "
	dev-ruby/activesupport
	>=dev-ruby/faraday-0.8 <dev-ruby/faraday-0.13
	>=dev-ruby/mechanize-2.6.0
"

all_ruby_prepare() {
	sed -i -e '/faraday/ s/0.10/0.13/' \
		-e '/mechanize/ s/2.6.0/>=2.6.0/' \
		${RUBY_FAKEGEM_GEMSPEC} || die
}
