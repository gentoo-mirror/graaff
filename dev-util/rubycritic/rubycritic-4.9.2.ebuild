# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="rubycritic.gemspec"

inherit ruby-fakegem

DESCRIPTION="Wraps around static analysis gems to provide a quality report of your Ruby code"
HOMEPAGE="https://github.com/whitesmith/rubycritic"
SRC_URI="https://github.com/whitesmith/rubycritic/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/flay-2.13:0
	>=dev-ruby/flog-4.7:0
	>=dev-ruby/launchy-2.5.2
	>=dev-ruby/parser-3.3.0.5
	>=dev-ruby/rainbow-3.1.1:3
	>=dev-ruby/reek-6.4.0:0
	dev-ruby/rexml
	>=dev-ruby/ruby_parser-3.21:3
	>=dev-ruby/simplecov-0.22.0
	>=dev-ruby/tty-which-0.5.0:0
	dev-ruby/virtus:0
"

ruby_add_bdepend "test? ( dev-ruby/minitest >=dev-util/aruba-2.2.0:2  dev-util/cucumber )"

all_ruby_prepare() {
	sed -e 's/git ls-files lib/find lib -type f -print/' \
		-e 's:git ls-files -- bin/\*:echo bin/rubycritic:' \
		-e 's/__dir__/"."/' \
		-e '/reek/ s/</>=/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

# 	# Avoid unpackaged dependencies
# 	sed -e '/rspec-benchmark/ s:^:#:' \
# 		-e '/Benchmark/ s:^:#:' \
# 		-i spec/spec_helper.rb || die
# 	rm -f spec/performance/reek/smell_detectors/runtime_speed_spec.rb || die
	# 	rm -rf spec/reek/code_climate || die

	sed -e '2irequire "rubycritic/version"' \
		-i features/step_definitions/rubycritic_steps.rb || die
}

each_ruby_test() {
	einfo "Unit tests"
	${RUBY} -I lib:test:. -e 'Dir["test/**/*_test.rb"].each { require _1 }' || die

	einfo "Integration tests with cucumber"
	export PATH=${S}/bin:${PATH}
	export RUBYLIB=${S}/lib
	CUCUMBER_PUBLISH_QUIET=true ${RUBY} -S cucumber --format progress features || die
}
