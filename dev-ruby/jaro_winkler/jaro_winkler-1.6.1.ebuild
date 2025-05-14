# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="jaro_winkler.gemspec"

RUBY_FAKEGEM_EXTENSIONS=(ext/jaro_winkler/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR="lib/jaro_winkler"

inherit ruby-fakegem

COMMIT=13c427010b8065c11f6ea917195b99502d4d8f67

DESCRIPTION="Implementation of Jaro-Winkler distance algorithm"
HOMEPAGE="https://github.com/tonytonyjan/jaro_winkler"
SRC_URI="https://github.com/tonytonyjan/jaro_winkler/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*"].each{ |f| require f }' || die
}
