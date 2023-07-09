# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

# All tests require live database servers
RUBY_FAKEGEM_RECIPE_TEST="none"

# The binary wrappers are already provided by freetds.
RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_EXTRAINSTALL="VERSION"

RUBY_FAKEGEM_EXTENSIONS=(ext/tiny_tds/extconf.rb)
RUBY_FAKEGEM_EXTENSION_LIBDIR=lib/tiny_tds

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
