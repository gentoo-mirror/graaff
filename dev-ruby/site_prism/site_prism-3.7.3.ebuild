# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

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

PATCHES=( "${FILESDIR}"/${P}-kwargs{1,2}.patch )

ruby_add_rdepend "
	>=dev-ruby/addressable-2.6:0
	>=dev-ruby/capybara-3.15:3
	>=dev-ruby/site_prism-all_there-0.3.1:0
"

all_ruby_prepare() {
	# Version does not get autoloaded.
	sed -i -e '3irequire "site_prism/version"' spec/site_prism/version_spec.rb || die

	sed -i -e '/simplecov/ s:^:#:' spec/spec_helper.rb || die
}
