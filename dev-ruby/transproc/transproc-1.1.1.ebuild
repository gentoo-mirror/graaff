# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Compose procs into a pipeline using left-to-right function composition"

HOMEPAGE="https://github.com/solnic/transproc"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_depend "test? ( dev-ruby/dry-equalizer )"

all_ruby_prepare() {
	sed -e '2irequire "pathname"' -i spec/spec_helper.rb || die
}
