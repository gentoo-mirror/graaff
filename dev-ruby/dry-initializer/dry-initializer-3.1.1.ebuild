# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="dry-initializer.gemspec"

inherit ruby-fakegem

DESCRIPTION="DSL for declaring params and options of the initializer"

HOMEPAGE="https://dry-rb.org/gems/dry-initializer"
SRC_URI="https://github.com/dry-rb/dry-initializer/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

# Avoid tests for now to simplify dependency tree
RESTRICT=test

#ruby_add_bdepend "test? (
#	dev-ruby/dry-types
#)"
