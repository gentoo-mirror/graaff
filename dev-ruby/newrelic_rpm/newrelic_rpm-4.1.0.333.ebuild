# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="cert config init.rb install.rb newrelic.yml recipes"

inherit ruby-fakegem

DESCRIPTION="A performance management system developed by New Relic"
HOMEPAGE="https://github.com/newrelic/rpm"
LICENSE="new-relic"

KEYWORDS="~amd64"
SLOT="4"

# Unpackaged hometown dependency
RESTRICT="test"
