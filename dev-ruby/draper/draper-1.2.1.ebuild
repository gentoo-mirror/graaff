# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="View Models for Rails"
HOMEPAGE="https://github.com/drapergem/draper"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/actionpack-3.2
	dev-ruby/active_model_serializers
	>=dev-ruby/activesupport-3.2
	>=dev-ruby/request_store-1.0.3"

ruby_add_bdepend "test? (
		>=dev-ruby/ammeter-0.2.2
		>=dev-ruby/railties-3.2
	)"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/ s:^:#:' spec/spec_helper.rb || die
	sed -i -e '3i require "draper"' spec/spec_helper.rb || die
}

each_ruby_test() {
	${RUBY} -S rspec spec/draper || die
}
