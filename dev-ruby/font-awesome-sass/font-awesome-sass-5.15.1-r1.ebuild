# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="assets"

inherit ruby-fakegem

DESCRIPTION="Font-Awesome Sass gem for use in Ruby/Rails projects"
HOMEPAGE="https://github.com/FortAwesome/font-awesome-sass"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="5"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/sassc-1.11:*
"
