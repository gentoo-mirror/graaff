# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Profiling toolkit for Rack applications with Rails integration"
HOMEPAGE="https://miniprofiler.com/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Tests are not packages in the gem and will be handled later.
RESTRICT=test

ruby_add_rdepend "
	>=dev-ruby/rack-1.2.0:*
"
