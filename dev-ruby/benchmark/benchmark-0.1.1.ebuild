# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="benchmark.gemspec"

inherit ruby-fakegem

DESCRIPTION="A performance benchmarking library"
HOMEPAGE="https://github.com/ruby/benchmark"
SRC_URI="https://github.com/ruby/benchmark/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Ruby BSD-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

all_ruby_prepare() {
	sed -i -e 's:_relative ": "./:' ${RUBY_FAKEGEM_GEMSPEC} || die
}
