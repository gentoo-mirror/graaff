# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="data tasks"
RUBY_FAKEGEM_GEMSPEC="foreman.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Manage Procfile-based applications"
HOMEPAGE="https://github.com/ddollar/foreman"
SRC_URI="https://github.com/ddollar/foreman/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
https://github.com/ddollar/foreman/commit/f77498130201febf38b423cb37615f5996576a28.patch -> ${P}-ruby32.patch"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

PATCHES=( "${DISTDIR}/${P}-ruby32.patch" )

ruby_add_bdepend "test? (
	dev-ruby/fakefs:0
	dev-ruby/timecop
)"

all_ruby_prepare() {
	# Avoid CLI specs since they require a lot of additional packages.
	rm -f spec/foreman/cli_spec.rb || die

	# Fix deprecated File.exists? not in the upstream PR.
	sed -e '/File/ s/exists/exist/' -i spec/foreman_spec.rb || die

	sed -e '1igem "fakefs", "~> 1.0"' \
		-e '/simplecov/,/^end/ s:^:#:' \
		-i spec/spec_helper.rb || die
}

all_ruby_install() {
	all_fakegem_install

	doman man/foreman.1
}
