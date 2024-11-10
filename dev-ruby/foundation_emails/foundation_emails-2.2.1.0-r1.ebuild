# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="A framework for creating responsive HTML emails that work in any email client"
HOMEPAGE="http://foundation.zurb.com/emails"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
