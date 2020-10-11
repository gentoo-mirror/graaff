# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_NAME="pipedrive.rb"

inherit ruby-fakegem

DESCRIPTION="Pipedrive.com API Wrapper"
HOMEPAGE="https://github.com/amoniacou/pipedrive.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-4.0.0:*
	dev-ruby/faraday:*
	dev-ruby/faraday_middleware:*
	>=dev-ruby/hashie-3.0:*
"

ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#:' spec/spec_helper.rb || die
	sed -i -e 's/v0.2.0/v0.3.0/' spec/lib/pipedrive/base_spec.rb || die
}
