# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="data tasks"
RUBY_FAKEGEM_GEMSPEC="foreman.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Manage Procfile-based applications"
HOMEPAGE="https://github.com/ddollar/foreman"
SRC_URI="https://github.com/ddollar/foreman/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? (
	dev-ruby/fakefs:3
	dev-ruby/timecop
)"

all_ruby_prepare() {
	# Avoid CLI specs since they require a lot of additional packages.
	rm -f spec/foreman/cli_spec.rb || die

	# Avoid bluepill exporter specs that differ on whitespace with ruby34
	rm -f spec/foreman/export/bluepill_spec.rb || die

	sed -e '/simplecov/,/^end/ s:^:#:' \
		-i spec/spec_helper.rb || die
}

all_ruby_install() {
	all_fakegem_install

	doman man/foreman.1
}
