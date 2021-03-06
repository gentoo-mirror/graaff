# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Integrate SassC-Ruby with Rails"
HOMEPAGE="https://github.com/sass/sassc-rails"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

IUSE=""

RESTRICT=test

ruby_add_rdepend "
	>=dev-ruby/sassc-2.0
	dev-ruby/tilt:*
	>=dev-ruby/railties-4:*
	>=dev-ruby/sprockets-3.0:*
	dev-ruby/sprockets-rails:*
"

each_ruby_test() {
	${RUBY} -S bundle exec rake test || die
}
