# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

# No tests upstream
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Module for defining custom exceptions with specific messages"
HOMEPAGE="https://github.com/ruby/e2mmap"
LICENSE="BSD-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
