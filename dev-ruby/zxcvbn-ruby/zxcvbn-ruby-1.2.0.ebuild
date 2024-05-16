# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
# ruby33 -> calculations are slightly off
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="HTTP User Agent parser"
HOMEPAGE="https://github.com/envato/zxcvbn-ruby/"
SRC_URI="https://github.com/envato/zxcvbn-ruby/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

all_ruby_prepare() {
	# Avoid javascript helpers since the depend on unpackaged mini_racer
	sed -e '/bundler/ s:^:#:' \
		-e '/JsHelpers/ s:^:#:' \
		-i spec/spec_helper.rb || die
	rm -f spec/support/js_helpers.rb || die
	sed -e '/gives back the same score for/ s/it/xit/' \
		-i spec/tester_spec.rb || die
	rm -f spec/omnimatch_spec.rb || die

	sed -e 's/git ls-files/find * -type f -print/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
