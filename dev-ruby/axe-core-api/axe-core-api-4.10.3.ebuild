# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="node_modules"

inherit ruby-fakegem

DESCRIPTION="Provides a collection of methods which interface as an API for Axe"
HOMEPAGE="https://github.com/dequelabs/axe-core-gems"

LICENSE="MPL-2.0"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

# Tests are not included in the gem and upstream source seems to require additional packaging steps.
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/dumb_delegator
	dev-ruby/ostruct
	dev-ruby/virtus
"

ruby_add_bdepend "test? (
	dev-ruby/capybara
	dev-ruby/selenium-webdriver
)"

all_ruby_prepare() {
	# Drop watir since it does not seem to be mandatory and isn't
	# packaged.
	sed -i -e '/watir/,/version_requirements/ s/:runtime/:development/' ../metadata || die
}
