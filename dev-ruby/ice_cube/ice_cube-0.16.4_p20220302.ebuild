# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

RUBY_FAKEGEM_EXTRAINSTALL="config"
RUBY_FAKEGEM_GEMSPEC="ice_cube.gemspec"
RUBY_FAKEGEM_VERSION="0.16.4"

COMMIT=10ae8dc1c64ea23c9461f2b046cf7ee4513050b9

inherit ruby-fakegem

DESCRIPTION="a recurring date library for Ruby"
HOMEPAGE="http://seejohncode.com/ice_cube/"
SRC_URI="https://github.com/seejohnrun/ice_cube/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activesupport dev-ruby/i18n dev-ruby/tzinfo )"

all_ruby_prepare() {
	sed -i -e 's/@example/example/' -e '/bundler/ s:^:#:' spec/spec_helper.rb || die
	rm -r .rspec || die
}

each_ruby_test() {
	TZ=utc RAILS_VERSION="~> 6.0" RSPEC_VERSION=3 ruby-ng_rspec || die
}
