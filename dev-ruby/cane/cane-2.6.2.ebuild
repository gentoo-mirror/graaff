# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="HISTORY.md README.md"

inherit ruby-fakegem

DESCRIPTION="Fails your build if code quality thresholds are not met"
HOMEPAGE="https://github.com/square/cane"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Tests depend on rspec-fire which is now obsolete due to rspec 3.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/parallel"
