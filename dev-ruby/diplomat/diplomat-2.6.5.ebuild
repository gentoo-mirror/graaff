# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="diplomat.gemspec"

inherit ruby-fakegem

DESCRIPTION="A simple wrapper for Consul"
HOMEPAGE="https://github.com/WeAreFarmGeek/diplomat"
SRC_URI="https://github.com/WeAreFarmGeek/diplomat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="2"
KEYWORDS="~amd64"

# Specs depend on unpackaged fakes-rspec
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/deep_merge-1.2:0
	|| ( dev-ruby/faraday:2 dev-ruby/faraday:1 )
"

all_ruby_prepare() {
	sed -e 's/git ls-files/find/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '/bundler/I s:^:#:' spec/spec_helper.rb || die
}
