# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_BINDIR="exe"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="erb_lint.gemspec"

inherit ruby-fakegem

DESCRIPTION="ERB Linter tool"
HOMEPAGE="https://github.com/Shopify/erb_lint"
SRC_URI="https://github.com/Shopify/erb_lint/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/activesupport:*
	>=dev-ruby/better_html-2.0.1
	>=dev-ruby/parser-2.7.1.4
	dev-ruby/rainbow:*
	>=dev-ruby/rubocop-1
	dev-ruby/smart_properties
"

ruby_add_bdepend "test? ( dev-ruby/fakefs )"
