# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="ChangeLog.md README.md"

RUBY_FAKEGEM_GEMSPEC="kicks.gemspec"

RUBY_FAKEGEM_BINWRAP="kicks"

inherit ruby-fakegem

DESCRIPTION="Fast background processing framework for Ruby and RabbitMQ"
HOMEPAGE="https://github.com/ruby-amqp/kicks"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/bunny-2.19 =dev-ruby/bunny-2*
	dev-ruby/concurrent-ruby:1
	>=dev-ruby/rake-12.3
	>=dev-ruby/serverengine-2.1:0
	dev-ruby/thor
"

ruby_add_bdepend "test? (
	dev-ruby/rr
)"

all_ruby_prepare() {
	sed -i -e '/bundler/,/^end/ s:^:#:' spec/spec_helper.rb || die

	sed -i -e '/metric_fu/ s:^:#:' Rakefile || die

	sed -e 's/git ls-files/find * -print/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	# Integration specs require more dependencies and runtime requirements
	rm -f spec/sneakers/integration_spec.rb || die

	# ActiveJob specs require unpackaged rabbitmq_http_api_client
	rm -f spec/sneakers/active_job_integration_spec.rb || die
}
