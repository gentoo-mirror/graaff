# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="jaro_winkler.gemspec"

RUBY_FAKEGEM_EXTENSIONS=(ext/jaro_winkler/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR="lib/jaro_winkler"

inherit ruby-fakegem

DESCRIPTION="Implementation of Jaro-Winkler distance algorithm"
HOMEPAGE="https://github.com/tonytonyjan/jaro_winkler"
SRC_URI="https://github.com/tonytonyjan/jaro_winkler/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="1"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*"].each{ |f| require f }' || die
}
