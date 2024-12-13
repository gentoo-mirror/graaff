# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="View Models for Rails"
HOMEPAGE="https://github.com/drapergem/draper"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

# Uses unpackaged dependencies and it not easy to isolate.
RESTRICT="test"

PATCHES=( "${FILESDIR}/${P}-view-context.patch" )

ruby_add_rdepend "
	>=dev-ruby/actionpack-6:*
	>=dev-ruby/activemodel-6:*
	dev-ruby/activemodel-serializers-xml:1.0
	>=dev-ruby/activesupport-6:*
	>=dev-ruby/request_store-1.0.3:0
	dev-ruby/ruby2_keywords"

each_ruby_test() {
	${RUBY} -S rspec-3 spec/draper || die
}
