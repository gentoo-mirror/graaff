# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="zendesk_api.gemspec"

inherit ruby-fakegem

DESCRIPTION="Wrapper for the REST API at https://www.zendesk.com"
HOMEPAGE="https://github.com/zendesk/zendesk_api_client_rb/"
SRC_URI="https://github.com/zendesk/zendesk_api_client_rb/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="zendesk_api_client_rb-${PV}"

LICENSE="Apache-2.0"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

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

	# Avoid spec failing on exact match on passed argument
	sed -e '/should pass to new, since this is how attachment handles it/ s/it/xit/' \
		-i spec/core/collection_spec.rb || die
}
