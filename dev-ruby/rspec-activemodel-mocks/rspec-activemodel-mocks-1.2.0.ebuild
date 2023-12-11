# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32"

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

ruby_add_bdepend "test? ( dev-ruby/activerecord[sqlite] )"
