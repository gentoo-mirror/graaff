# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTENSIONS=(ext/stackprof/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="A fast sampling profiler for ruby code"
HOMEPAGE="https://github.com/tmm1/stackprof"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Tests are not packages in the gem and will be handled later.
RESTRICT=test