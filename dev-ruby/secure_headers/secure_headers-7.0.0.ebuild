# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Security related headers all in one gem"
HOMEPAGE="https://github.com/github/secure_headers"
LICENSE="Apache-2.0"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_depend "test? ( dev-ruby/rack )"

all_ruby_prepare() {
	sed -i -e '/pry/ s:^:#:' \
		-e '/coverall/I s:^:#:' \
		-e '2irequire "securerandom"; require "uri"; require "json"; require "digest"' \
		spec/spec_helper.rb || die
}
