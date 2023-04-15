# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="solargraph-rails.gemspec"

inherit ruby-fakegem

DESCRIPTION="Add reflection on ActiveModel dynamic attributes that will be created at runtime"
HOMEPAGE="https://github.com/iftheshoefritz/solargraph-rails"
SRC_URI="https://github.com/iftheshoefritz/solargraph-rails/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

# Does not run due to bundler issues, to be revisited later.
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/activesupport
	dev-ruby/solargraph
"
