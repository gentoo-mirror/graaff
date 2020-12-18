# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="NEWS.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_BINWRAP=""

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

each_ruby_prepare() {
	mkdir lib || die
}

each_ruby_configure() {
	${RUBY} -Cext/strscan extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/strscan
	cp ext/strscan/strscan.so lib/ || die
}
