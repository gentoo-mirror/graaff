# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="resources"
RUBY_FAKEGEM_GEMSPEC="json-schema.gemspec"

inherit ruby-fakegem

DESCRIPTION="Ruby JSON Schema Validator"

HOMEPAGE="https://github.com/voxpupuli/json-schema/"
SRC_URI="https://github.com/voxpupuli/json-schema/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/addressable-2.8
	>=dev-ruby/bigdecimal-3.1:0
"

ruby_add_depend "test? ( dev-ruby/webmock )"
