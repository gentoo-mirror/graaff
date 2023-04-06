# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="app"
RUBY_FAKEGEM_GEMSPEC="view_component.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="A framework for building reusable, encapsulated view components in Ruby on Rails"
HOMEPAGE="https://viewcomponent.org/"
SRC_URI="https://github.com/ViewComponent/view_component/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	|| ( dev-ruby/activesupport:7.0 dev-ruby/activesupport:6.1 )
	dev-ruby/concurrent-ruby:1
	dev-ruby/method_source:0
"
