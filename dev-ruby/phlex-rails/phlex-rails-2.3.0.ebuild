# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="phlex-rails.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A high-performance view framework optimised for developer happiness"
HOMEPAGE="https://github.com/yippee-fun/phlex-rails"
SRC_URI="https://github.com/yippee-fun/phlex-rails/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="test"

# Currently requires a git checkout of appraisal.
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/phlex:2.3
	|| ( dev-ruby/railties:8.0 dev-ruby/railties:7.2 dev-ruby/railties:7.1 )
"

ruby_add_bdepend "test? (
	dev-ruby/rspec-rails
)"

all_ruby_prepare() {
	sed -e 's:_relative ": "./:' \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
