# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem versionator

DESCRIPTION="Integrate SassC-Ruby with Rails"
HOMEPAGE="https://github.com/sass/sassc-rails"

LICENSE="MIT"
SLOT="$(get_version_component_range 1)"
KEYWORDS="~amd64"

IUSE=""

RESTRICT=test

ruby_add_rdepend "
	dev-ruby/sass:*
	>=dev-ruby/sassc-1.9 =dev-ruby/sassc-1*
	dev-ruby/tilt:*
	=dev-ruby/railties-4*:*
	>=dev-ruby/sprockets-2.11:*
	dev-ruby/sprockets-rails:*
"

each_ruby_test() {
	${RUBY} -S bundle exec rake test || die
}
