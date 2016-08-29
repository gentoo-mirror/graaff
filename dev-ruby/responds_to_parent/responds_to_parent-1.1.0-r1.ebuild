# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="Adds responds_to_parent to your controller to respond to the parent document of your page."
HOMEPAGE="http://github.com/markcatley/responds_to_parent"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

RUBY_PATCHES=( ${P}-rails3.patch )

# Tests require additional dependencies.
RESTRICT="test"
