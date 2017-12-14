# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Wrapper for the REST API at https://www.zendesk.com"
HOMEPAGE="https://github.com/zendesk/zendesk_api_client_rb/"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/faraday-0.9:0
	>=dev-ruby/hashie-3.5.3:3
	dev-ruby/inflection
	dev-ruby/multipart-post:0
	dev-ruby/mime-types
"
