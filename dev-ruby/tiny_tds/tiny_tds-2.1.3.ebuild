# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

# All tests require live database servers
RUBY_FAKEGEM_RECIPE_TEST="none"

# The binary wrappers are already provided by freetds.
RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_EXTRAINSTALL="VERSION"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A modern, simple and fast FreeTDS library for Ruby using DB-Library"
HOMEPAGE="https://github.com/rails-sqlserver/tiny_tds"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=">=dev-db/freetds-0.95"
DEPEND+=">=dev-db/freetds-0.95"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' test/test_helper.rb || die
	sed -i -e '/portile/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_configure() {
	${RUBY} -Cext/tiny_tds extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/tiny_tds
	cp ext/tiny_tds/tiny_tds.so lib/tiny_tds/ || die
}
