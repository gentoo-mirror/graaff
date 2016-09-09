# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="data config"

inherit ruby-fakegem

DESCRIPTION="Configurable tool for writing clean and consistent SCSS"
HOMEPAGE="https://github.com/causes/scss-lint"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/rainbow:2
	>=dev-ruby/sass-3.4.1:3.4
"

ruby_add_bdepend "
	test? ( >=dev-ruby/nokogiri-1.6.0 )
"

all_ruby_prepare() {
	# Skip tests that depend on specific file ordering.
	rm spec/scss_lint/file_finder_spec.rb || die
}
