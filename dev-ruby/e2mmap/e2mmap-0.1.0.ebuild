# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Module for defining custom exceptions with specific messages"
HOMEPAGE="https://github.com/ruby/e2mmap"
LICENSE="BSD-2"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
