# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

# rspec3 but requires bundler and thus has dependency complications
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="VERSION"

inherit ruby-fakegem

DESCRIPTION="The power of the premailer gem to Rails without any configuration needs"
HOMEPAGE="https://github.com/fphilipe/premailer-rails"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/actionmailer-3:*
	dev-ruby/net-smtp
	>=dev-ruby/premailer-1.7.9:1
"

ruby_add_bdepend "
	test? ( dev-ruby/nokogiri )
"

all_ruby_prepare() {
	sed -i -e '/if RUBY_ENGINE/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
