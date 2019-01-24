# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="ChangeLog.md README.md"

inherit ruby-fakegem

DESCRIPTION="Fast background processing framework for Ruby and RabbitMQ"
HOMEPAGE="https://jondot.github.io/sneakers/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/bunny-2.12 =dev-ruby/bunny-2*
	dev-ruby/concurrent-ruby:1
	dev-ruby/rake
	>=dev-ruby/serverengine-2.0.5 =dev-ruby/serverengine-2.0*
	dev-ruby/thor
"

ruby_add_bdepend "test? (
	dev-ruby/rr
)"

all_ruby_prepare() {
	sed -i -e '/bundler/,/^end/ s:^:#:' spec/spec_helper.rb || die

	sed -i -e '/metric_fu/ s:^:#:' Rakefile || die

	# Integration specs require more dependencies and runtime requirements
	rm -f spec/sneakers/integration_spec.rb || die
}
