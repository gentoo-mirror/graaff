# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-rails.gemspec"

inherit ruby-fakegem

DESCRIPTION="A collection of RuboCop cops to check for performance optimizations in Ruby code"
HOMEPAGE="https://github.com/rubocop/rubocop-rails/"
SRC_URI="https://github.com/rubocop/rubocop-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/activesupport-4.2.0:*
	>=dev-ruby/rack-1.1:*
	>=dev-ruby/rubocop-1.52.0 =dev-ruby/rubocop-1*
	>=dev-ruby/rubocop-ast-1.31.1:1
"
