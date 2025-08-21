# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="app templates"
RUBY_FAKEGEM_GEMSPEC="datagrid.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Library that provides a DSL to present table like data"
HOMEPAGE="https://github.com/bogdan/datagrid"
SRC_URI="https://github.com/bogdan/datagrid/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	|| ( dev-ruby/railties:8.0 dev-ruby/railties:7.2 dev-ruby/railties:7.1 dev-ruby/railties:7.0 )
"

ruby_add_depend "test? (
	|| ( dev-ruby/rails:8.0 dev-ruby/rails:7.2 dev-ruby/rails:7.1 dev-ruby/rails:7.0 )
)"

all_ruby_prepare() {
	sed -e 's/git ls-files/find */' \
		-e 's:_relative ": "./:' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -e '/require.*bundler/ s:^:#:' \
		-e '/Bundler.setup/ s:^:#:' \
		-e '/require.*mongoid/ s:^:#:' \
		-e 's/NO_MONGO = .*$/NO_MONGO = true/' \
		-e '21irequire "active_support/core_ext/hash/indifferent_access"' \
		-e '21irequire "active_support/time_with_zone"' \
		-i spec/spec_helper.rb || die

	rm -f spec/support/mongoid.rb || die
	sed -e 's/mongoid: MongoidEntry,*//' \
		-i spec/datagrid/filters/date_{,time_}filter_spec.rb || die
	sed -e '/MongoidEntry/ s:^:#:' \
		-i spec/datagrid/drivers/active_record_spec.rb || die
}
