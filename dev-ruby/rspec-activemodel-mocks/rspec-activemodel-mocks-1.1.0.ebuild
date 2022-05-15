# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="RSpec test doubles for ActiveModel and ActiveRecord"
HOMEPAGE="https://github.com/rspec/rspec-activemodel-mocks"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0:*
	>=dev-ruby/activemodel-3.0:*
	>=dev-ruby/rspec-mocks-2.99:* <dev-ruby/rspec-mocks-4:*"

ruby_add_bdepend "test? ( <dev-ruby/activerecord-7[sqlite] )"

all_ruby_prepare() {
	# Avoid spec failing on 6.0+ for models with no primary key
	# https://github.com/rspec/rspec-activemodel-mocks/pull/45
	sed -i -e '/with an ActiveRecord model with no primary key/,/^  end/ s:^:#:' spec/rspec/active_model/mocks/stub_model_spec.rb || die

	sed -i -e '1igem "activerecord", "<7"' spec/spec_helper.rb || die
}
