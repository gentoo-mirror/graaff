# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="enumerable-statistics.gemspec"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="This library provides statistics features for Enumerable"
HOMEPAGE="https://github.com/mrkn/enumerable-statistics"
SRC_URI="https://github.com/mrkn/enumerable-statistics/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e 's/git ls-files -z/find . -print0/' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_configure() {
	${RUBY} -C ext/enumerable/statistics/extension extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -C ext/enumerable/statistics/extension
	mkdir -p lib/enumerable/statistics || die
	cp ext/enumerable/statistics/extension/extension.so lib/enumerable/statistics/ || die
}
