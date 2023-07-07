# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="zendesk_api.gemspec"

inherit ruby-fakegem

DESCRIPTION="Wrapper for the REST API at https://www.zendesk.com"
HOMEPAGE="https://github.com/zendesk/zendesk_api_client_rb/"
SRC_URI="https://github.com/zendesk/zendesk_api_client_rb/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="zendesk_api_client_rb-${PV}"

LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	dev-ruby/faraday:2
	dev-ruby/faraday-multipart
	dev-ruby/hashie:5
	dev-ruby/inflection
	dev-ruby/mini_mime
	=dev-ruby/multipart-post-2*
"

ruby_add_bdepend "test? ( dev-ruby/vcr:6 dev-ruby/webmock )"

all_ruby_prepare() {
	# Avoid live specs that require a network and credentials
	rm -rf spec/live || die

	sed -i -e '/byebug/ s:^:#:' spec/core/spec_helper.rb || di

	# Fix new rspec matcher kwargs issue
	sed -i -e '549 s/:id/{:id/ ; 549 s/))/)})/' spec/core/collection_spec.rb || die
}
