# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Watches for termination of multiple threads"
HOMEPAGE="https://github.com/ruby/thwait"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "dev-ruby/e2mmap"
