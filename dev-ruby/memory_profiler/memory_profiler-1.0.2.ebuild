# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="memory_profiler.gemspec"

inherit ruby-fakegem

DESCRIPTION="Memory profiling routines for Ruby 2.5+"
HOMEPAGE="https://github.com/SamSaffron/memory_profiler"
SRC_URI="https://github.com/SamSaffron/memory_profiler/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
