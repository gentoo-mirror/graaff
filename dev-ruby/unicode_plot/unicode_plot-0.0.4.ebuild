# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

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
IUSE=""

ruby_add_rdepend ">=dev-ruby/enumerable-statistics-2.0.1"
