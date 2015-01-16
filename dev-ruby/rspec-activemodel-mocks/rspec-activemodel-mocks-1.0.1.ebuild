# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rspec-rails/rspec-rails-3.1.0.ebuild,v 1.1 2015/01/16 13:02:58 graaff Exp $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem versionator

DESCRIPTION="RSpec test doubles for ActiveModel and ActiveRecord"
HOMEPAGE="http://github.com/thomas-holmes/rspec-activemodel-mocks"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

SUBVERSION="$(get_version_component_range 1-2)"

ruby_add_rdepend ">=dev-ruby/activesupport-3.0
	>=dev-ruby/activemodel-3.0
	>=dev-ruby/railties-3.0
	>=dev-ruby/rspec-mocks-2.99 <dev-ruby/rspec-mocks-4"
