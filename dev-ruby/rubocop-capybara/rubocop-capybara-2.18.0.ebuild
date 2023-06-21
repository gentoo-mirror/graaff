# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-capybara.gemspec"

inherit ruby-fakegem

DESCRIPTION="Code style checking for RSpec files"
HOMEPAGE="https://github.com/rubocop/rubocop-capybara"
SRC_URI="https://github.com/rubocop/rubocop-capybara/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	=dev-ruby/rubocop-1* >=dev-ruby/rubocop-1.41
"
