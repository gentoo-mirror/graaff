# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="HACKING.md README.md UPGRADING.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="site_prism.gemspec"

inherit ruby-fakegem

DESCRIPTION="A simple, clean and semantic DSL for describing your site with Page Object Model"
HOMEPAGE="https://github.com/site-prism/site_prism"
SRC_URI="https://github.com/site-prism/site_prism/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE="doc"

ruby_add_rdepend "
	>=dev-ruby/addressable-2.8:0
	>=dev-ruby/capybara-3.27:3
	dev-ruby/site_prism-all_there:2
"

all_ruby_prepare() {
	sed -i -e '/simplecov/ s:^:#:' spec/spec_helper.rb || die
}
