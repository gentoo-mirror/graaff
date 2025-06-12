# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="rack-mini-profiler.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Profiling toolkit for Rack applications with Rails integration"
HOMEPAGE="https://miniprofiler.com/"
SRC_URI="https://github.com/MiniProfiler/rack-mini-profiler/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
iUSE="test"

ruby_add_rdepend "
	>=dev-ruby/rack-1.2.0:*
"

ruby_add_bdepend "test? ( dev-ruby/memory_profiler dev-ruby/rack:2.2 dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile || die

	# Avoid specs depending on external running dependencies
	rm -f spec/lib/storage/{memcache,redis}_store_spec.rb || die

	# Avoid webpacker specs since webpacker is obsolete
	sed -e '/get_webpacker_assets_path returns webpacker/ s/it/xit/' \
		-i spec/integration/railtie_methods_spec.rb || die

	# Avoid rack 3 for now
	sed -e '4igem "rack", "~> 2.2.0"' \
		-e '/simplecov/,/^end/ s:^:#:' \
		-i spec/spec_helper.rb || die
}
