# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

RUBY_FAKEGEM_GEMSPEC="unicode_plot.gemspec"

inherit ruby-fakegem

DESCRIPTION="Plot your data by Unicode characters"
HOMEPAGE="https://github.com/red-data-tools/unicode_plot.rb"
SRC_URI="https://github.com/red-data-tools/unicode_plot.rb/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="unicode_plot.rb-${PV}"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/enumerable-statistics-2.0.1"

ruby_add_bdepend "dev-ruby/yard"
