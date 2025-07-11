# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="dry-configurable.gemspec"

inherit ruby-fakegem

DESCRIPTION="A mixin to add configuration functionality to your classes"

HOMEPAGE="https://dry-rb.org/gems/dry-configurable/"
SRC_URI="https://github.com/dry-rb/dry-configurable/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/dry-core-1.1:1
	>=dev-ruby/zeitwerk-2.6:2
"

all_ruby_prepare() {
	# Avoid unpackaged rspec-benchmark package for now
	sed -e '/benchmark/I s:^:#:' -i spec/spec_helper.rb || die
	sed -e '/is memoized when the config is finalized/ s/it/xit/' \
		-i spec/integration/dry/configurable/config_spec.rb || die
}
