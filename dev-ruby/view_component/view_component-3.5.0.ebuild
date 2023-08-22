# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="app"
RUBY_FAKEGEM_GEMSPEC="view_component.gemspec"

inherit ruby-fakegem

DESCRIPTION="A framework for building reusable, encapsulated view components in Ruby on Rails"
HOMEPAGE="https://viewcomponent.org/"
SRC_URI="https://github.com/ViewComponent/view_component/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

# Many unpackaged dependencies are needed
RESTRICT="test"

ruby_add_rdepend "
	|| ( dev-ruby/activesupport:7.0 dev-ruby/activesupport:6.1 )
	dev-ruby/concurrent-ruby:1
	dev-ruby/method_source:0
"

ruby_add_bdepend "test? (
	dev-ruby/jbuilder
)"

all_ruby_prepare() {
	sed -e '/simplecov/ s:^:#:' \
		-e '/bundler/ s:^:#:' \
		-i test/test_helper.rb || die
}
