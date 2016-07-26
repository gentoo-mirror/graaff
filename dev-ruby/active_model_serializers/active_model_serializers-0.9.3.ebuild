# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md DESIGN.textile README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Making it easy to serialize models for client-side use"
HOMEPAGE="https://github.com/rails-api/active_model_serializers"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.9"
IUSE="test"

# A bit more complicated setup than I have time for now...
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/activemodel-3.2:*"

#ruby_add_bdepend "test? ( >=dev-ruby/rails-3.0 )"
