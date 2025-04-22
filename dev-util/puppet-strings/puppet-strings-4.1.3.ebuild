# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="puppet-strings.gemspec"

inherit ruby-fakegem

DESCRIPTION="Puppet documentation via YARD"
HOMEPAGE="https://github.com/puppetlabs/puppet-strings"
SRC_URI="https://github.com/puppetlabs/puppet-strings/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# depends on unpackaged puppet_litmis and json_spec
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/rgen-0.9:0
	>=dev-ruby/yard-0.9.5 =dev-ruby/yard-0*
"
