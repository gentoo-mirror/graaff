# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

inherit ruby-fakegem

DESCRIPTION="A wonderfully simple way to load your code"
HOMEPAGE="https://github.com/jarmo/require_all"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -i '/cov/I s:^:#: ; 1irequire "fileutils"' spec/spec_helper.rb || die

	# Account for different error output on Ruby 3.4.
	sed -e '/expect/ s/`non_existent_method/.non_existent_method/' \
		-i spec/require_spec.rb || die
}
