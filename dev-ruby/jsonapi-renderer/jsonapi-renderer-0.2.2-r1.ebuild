# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="jsonapi-renderer.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Efficiently render JSON API documents"
HOMEPAGE="https://github.com/jsonapi-rb/jsonapi-renderer"
SRC_URI="https://github.com/jsonapi-rb/jsonapi-renderer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#: ; 1irequire "json"' spec/spec_helper.rb || die
}
