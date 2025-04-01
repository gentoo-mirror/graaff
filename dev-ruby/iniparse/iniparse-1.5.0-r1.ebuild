# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="iniparse.gemspec"

inherit ruby-fakegem

DESCRIPTION="A pure Ruby library for parsing INI configuration and data files"
HOMEPAGE="https://github.com/antw/iniparse"
SRC_URI="https://github.com/antw/iniparse/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="1"
KEYWORDS="~amd64"
