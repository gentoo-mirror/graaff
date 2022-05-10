# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="NEWS.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_EXTENSIONS=(ext/strscan/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="Provides lexical scanning operations on a String"
HOMEPAGE="https://github.com/ruby/strscan"
SRC_URI="https://github.com/ruby/strscan/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

all_ruby_prepare() {
	sed -i -e 's/__dir__/"."/' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	RUBYOPT="-Ilib -Itest/lib -rhelper" ${RUBY} run-test.rb || die
}
