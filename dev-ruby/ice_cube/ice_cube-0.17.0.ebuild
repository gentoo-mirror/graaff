# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md UPGRADING.md"

RUBY_FAKEGEM_EXTRAINSTALL="config"
RUBY_FAKEGEM_GEMSPEC="ice_cube.gemspec"

COMMIT=ee21ea6772bf7cf5a80c63e2f880046e30839744

inherit ruby-fakegem

DESCRIPTION="a recurring date library for Ruby"
HOMEPAGE="https://github.com/ice-cube-ruby/ice_cube"
SRC_URI="https://github.com/ice-cube-ruby/ice_cube/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/activesupport dev-ruby/i18n dev-ruby/tzinfo )"

all_ruby_prepare() {
	sed -i -e 's/@example/example/' -e '/bundler/ s:^:#:' spec/spec_helper.rb || die
	rm -r .rspec || die
}

each_ruby_test() {
	TZ=utc RAILS_VERSION="~> 7.1" RSPEC_VERSION=3 ruby-ng_rspec || die
}
