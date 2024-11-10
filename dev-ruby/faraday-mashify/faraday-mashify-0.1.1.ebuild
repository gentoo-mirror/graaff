# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="faraday-mashify.gemspec"

inherit ruby-fakegem

DESCRIPTION="Faraday middleware for wrapping responses into Hashie::Mash"
HOMEPAGE="https://github.com/sue445/faraday-mashify"
SRC_URI="https://github.com/sue445/faraday-mashify/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/faraday:2
	dev-ruby/hashie:*
"

all_ruby_prepare() {
	sed -i -e "s:_relative ': './:" ${RUBY_FAKEGEM_GEMSPEC} || die
}
