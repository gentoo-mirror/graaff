# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="History.txt README.md"
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="A Ruby implementation of the Patience diff algorithm."
HOMEPAGE="https://github.com/watt/ruby_patience_diff"

LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "dev-ruby/optimist:3"
