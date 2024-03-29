# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="ChangeLog.md README.md"

RUBY_FAKEGEM_GEMSPEC="sneakers.gemspec"

RUBY_FAKEGEM_BINWRAP="sneakers"

inherit ruby-fakegem

DESCRIPTION="Fast background processing framework for Ruby and RabbitMQ"
HOMEPAGE="https://jondot.github.io/sneakers/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/bunny-2.14 =dev-ruby/bunny-2*
	dev-ruby/concurrent-ruby:1
	dev-ruby/rake
	>=dev-ruby/serverengine-2.1
	dev-ruby/thor
"

ruby_add_bdepend "test? (
	dev-ruby/rr
)"

all_ruby_prepare() {
	sed -i -e '/bundler/,/^end/ s:^:#:' spec/spec_helper.rb || die

	sed -i -e '/metric_fu/ s:^:#:' Rakefile || die

	# Update rake version
	sed -i -e '/rake/ s/~>/>=/' -e '/serverengine/ s/2.1.0/2.1/' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Integration specs require more dependencies and runtime requirements
	rm -f spec/sneakers/integration_spec.rb || die
}
