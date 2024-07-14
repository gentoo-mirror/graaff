# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

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

ruby_add_rdepend "
	>=dev-ruby/addressable-2.8
"
