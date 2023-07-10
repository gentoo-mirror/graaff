# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Watches for termination of multiple threads"
HOMEPAGE="https://github.com/ruby/thwait"
LICENSE="BSD"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "dev-ruby/e2mmap"
