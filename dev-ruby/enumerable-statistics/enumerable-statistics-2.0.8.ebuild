# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="enumerable-statistics.gemspec"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_EXTENSIONS=(ext/enumerable/statistics/extension/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR=lib/enumerable/statistics

inherit ruby-fakegem

DESCRIPTION="This library provides statistics features for Enumerable"
HOMEPAGE="https://github.com/mrkn/enumerable-statistics"
SRC_URI="https://github.com/mrkn/enumerable-statistics/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -i -e 's/git ls-files -z/find * -print0/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
