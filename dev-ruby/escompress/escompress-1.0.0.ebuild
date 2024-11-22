# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Use esbuild to compress your Rails CSS"
HOMEPAGE="https://github.com/jwilsjustin/escompress"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

# Tests are not included in the gem and require esbuild to be installed somewhere.
RESTRICT="test"
