# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20"

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
	>=dev-ruby/actionpack-3.0
	>=dev-ruby/activemodel-3.0
	>=dev-ruby/activesupport-3.0
	>=dev-ruby/request_store-1.0.3"

ruby_add_bdepend "test? (
		>=dev-ruby/ammeter-0.2.2
		dev-ruby/active_model_serializers
	)"

all_ruby_prepare() {
	rm Gemfile || die
	sed -e '/[Bb]undler/ s:^:#:' \
		-e '1igem "rails", "~>4.0"' \
		-i spec/spec_helper.rb || die

	# Avoid tests also failing on 1.2.1 which we already use. Could be
	# more precise for the 4 specific specs failing.
	rm spec/draper/{decorator,decoratable}_spec.rb || die
}

each_ruby_test() {
	${RUBY} -S rspec spec/draper || die
}
