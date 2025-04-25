# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_EXTRAINSTALL="data"
RUBY_FAKEGEM_GEMSPEC="phonelib.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Use Google libphonenumber data for validation and number formatting"
HOMEPAGE="https://github.com/daddyz/phonelib"
SRC_URI="https://github.com/daddyz/phonelib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "test? (
	>=dev-ruby/nokogiri-1.15
)"

all_ruby_prepare() {
	rm -f Gemfile.lock || die

	# Use modern gem version that work with recent ruby versions. Drop
	# development-only dependencies.
	sed -e "s:_relative ': './:" \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -e '/simplecov/I s:^:#:' -i spec/phonelib_spec.rb || die

	# Avoid the dummy rails application. It does not seem to work and
	# requires dependencies that have not been configured.
	rm -rf spec/dummy/spec || die
}
