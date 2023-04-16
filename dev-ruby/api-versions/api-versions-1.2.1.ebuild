# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="Changes.md README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

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
