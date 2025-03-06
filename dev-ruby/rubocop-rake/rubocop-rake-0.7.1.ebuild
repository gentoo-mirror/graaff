# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_GEMSPEC="rubocop-rake.gemspec"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="A RuboCop for rake"
HOMEPAGE="https://github.com/rubocop/rubocop-rake/"
SRC_URI="https://github.com/rubocop/rubocop-rake/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_depend "
	>=dev-ruby/lint_roller-1.1:1
	>=dev-ruby/rubocop-1.72.1:0
"

all_ruby_prepare() {
	sed -e "s:_relative ': './:" \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
