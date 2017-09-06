# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Security related headers all in one gem"
HOMEPAGE="https://github.com/twitter/secureheaders"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="3"
IUSE=""

ruby_add_rdepend "dev-ruby/useragent"

all_ruby_prepare() {
	sed -i -e '/pry/ s:^:#:' \
		-e '/coverall/I s:^:#:' \
		-e '1irequire "securerandom"; require "uri"; require "json"' \
		spec/spec_helper.rb || die
}
