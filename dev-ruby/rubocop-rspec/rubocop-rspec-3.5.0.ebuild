# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-rspec.gemspec"

inherit ruby-fakegem

DESCRIPTION="Code style checking for RSpec files"
HOMEPAGE="https://github.com/rubocop/rubocop-rspec"
SRC_URI="https://github.com/rubocop/rubocop-rspec/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/lint_roller-1.1:1
	=dev-ruby/rubocop-1* >=dev-ruby/rubocop-1.72.1
"

ruby_add_depend "test? ( dev-ruby/yard )"

all_ruby_prepare() {
	# Avoid test making unwarrented assumptions about the current
	# directory.
	sed -e '/puts the configuration path/ s/it/xit/' \
		-i spec/rubocop/rspec/inject_spec.rb || die
}
