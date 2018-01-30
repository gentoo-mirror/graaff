# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="Readme.rdoc"

COMMIT=e9e1250e3a4860c97fa5a3e0994bc4c1d6e1b520

inherit ruby-fakegem

DESCRIPTION="Adds responds_to_parent to your controller to respond to the parent document."
HOMEPAGE="https://github.com/markcatley/responds_to_parent"
SRC_URI="https://github.com/markcatley/responds_to_parent/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RUBY_PATCHES=( ${PN}-1.1.0-rails42.patch )

# Tests require additional dependencies.
RESTRICT="test"
