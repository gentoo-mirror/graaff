# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Cucumber step definitions for Axe"
HOMEPAGE="https://github.com/dequelabs/axe-core-gems"

LICENSE="MPL-2.0"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/axe-core-api
	dev-ruby/dumb_delegator
	dev-ruby/ostruct
	dev-ruby/virtus
"
