# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Common interface for Ruby's HTTP libraries"
HOMEPAGE="http://github.com/savonrb/httpi"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Requires puma for all integration specs
RESTRICT="test"
