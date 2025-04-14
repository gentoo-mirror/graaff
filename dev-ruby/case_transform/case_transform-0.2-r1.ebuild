# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Extraction of the key_transform abilities of ActiveModelSerializers"
HOMEPAGE="https://github.com/rails-api/case_transform"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# No tests in gem and no tagged release.
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/activesupport:*
"
