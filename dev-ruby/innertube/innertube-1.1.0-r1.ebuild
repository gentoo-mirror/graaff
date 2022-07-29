# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="A thread-safe resource pool, originally borne in riak-client (Ripple)"
HOMEPAGE="https://github.com/basho/innertube"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/thwait )"

all_ruby_prepare() {
	sed -i -e 's/mock/double/ ; s/message/puts/' spec/innertube_spec.rb || die
}
