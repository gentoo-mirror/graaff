# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="dry-validation.gemspec"

inherit ruby-fakegem

DESCRIPTION="Validation library"

HOMEPAGE="https://dry-rb.org/gems/dry-validation/"
SRC_URI="https://github.com/dry-rb/dry-validation/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/concurrent-ruby:1
	>=dev-ruby/dry-core-1.1:1
	>=dev-ruby/dry-initializer-3.2:3
	>=dev-ruby/dry-schema-1.13.0:1
	>=dev-ruby/zeitwerk-2.6:2
"

ruby_add_depend "test? ( dev-ruby/dry-monads dev-ruby/i18n )"

all_ruby_prepare() {
	sed -e '/Warning.process/ s:^:#:' \
		-i spec/spec_helper.rb || die
}
