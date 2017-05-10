# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Making it easy to serialize models for client-side use"
HOMEPAGE="https://github.com/rails-api/active_model_serializers"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.10"
IUSE="test"

# A bit more complicated setup than I have time for now...
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/actionpack-4.1:* <dev-ruby/actionpack-6:*
	>=dev-ruby/activemodel-4.1:* <dev-ruby/activemodel-6:*
	>=dev-ruby/case_transform-0.2
	=dev-ruby/jsonapi-renderer-0.1*
"

#ruby_add_bdepend "test? ( >=dev-ruby/rails-3.0 )"
