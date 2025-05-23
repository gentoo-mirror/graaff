# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

# No tests upstream
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Module for defining custom exceptions with specific messages"
HOMEPAGE="https://github.com/ruby/e2mmap"
LICENSE="BSD-2"

SLOT="0"
KEYWORDS="~amd64"
