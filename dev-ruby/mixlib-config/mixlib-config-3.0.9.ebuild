# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRA_DOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="mixlib-config.gemspec"

inherit ruby-fakegem

DESCRIPTION="A class based configuration library"
HOMEPAGE="https://github.com/opscode/mixlib-config"
SRC_URI="https://github.com/opscode/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/tomlrb"

all_ruby_prepare() {
	# Avoid spec failing without bundler
	sed -i -e '/turns \(TOML\|YAML\) into method-style setting/askip "fails without bundler"' spec/mixlib/config_spec.rb || die
}
