# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="reek.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Examines Ruby classes, modules and methods and reports any code smells it finds"
HOMEPAGE="https://github.com/troessner/reek"
SRC_URI="https://github.com/troessner/reek/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/dry-schema-1.13:1
	>=dev-ruby/logger-1.6:0
	=dev-ruby/parser-3.3*
	dev-ruby/rainbow:3
	>=dev-ruby/rexml-3.1:3
"

all_ruby_prepare() {
	sed -e "s:_relative ': './:" \
		-e 's/git ls-files -z/find * -print0/' \
		-e 's/__dir__/"."/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	# Avoid unpackaged dependencies
	sed -e '/rspec-benchmark/ s:^:#:' \
		-e '/Benchmark/ s:^:#:' \
		-i spec/spec_helper.rb || die
	rm -f spec/performance/reek/smell_detectors/runtime_speed_spec.rb || die
	rm -rf spec/reek/code_climate || die
}
