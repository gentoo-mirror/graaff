# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="Changes.md README.md"

inherit ruby-fakegem

DESCRIPTION="a Gem to help you manage your Rails API endpoints"
HOMEPAGE="https://github.com/EDMC/api-versions"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

# Needs a specific old version of ammeter that is no longer available
# for us.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/actionpack-3.0:* >=dev-ruby/activesupport-3.0:*"
