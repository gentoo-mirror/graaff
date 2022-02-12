# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="diplomat.gemspec"

inherit ruby-fakegem

DESCRIPTION="A simple wrapper for Consul"
HOMEPAGE="https://github.com/WeAreFarmGeek/diplomat"
SRC_URI="https://github.com/WeAreFarmGeek/diplomat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="2"

# Specs depend on unpackaged fakes-rspec
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/deep_merge-1.2:0
	|| ( dev-ruby/faraday:1 >=dev-ruby/faraday-0.9:0 )
"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' spec/spec_helper.rb || die
}
