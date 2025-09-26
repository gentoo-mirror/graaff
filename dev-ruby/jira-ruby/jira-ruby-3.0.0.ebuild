# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="jira-ruby.gemspec"

inherit ruby-fakegem

DESCRIPTION="API for JIRA"
HOMEPAGE="https://github.com/sumoheavy/jira-ruby"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/activesupport:*
	dev-ruby/atlassian-jwt
	dev-ruby/multipart-post
	dev-ruby/oauth:1
"

ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e '/\(bundle\|pry\)/ s:^:#:' spec/spec_helper.rb || die

	# Drop integration tests for now since they require an ancient version of webmock.
	rm -rf spec/integration || die
	sed -e '/fails with wrong user name and password/askip "ancient webmock"' \
		-e '/only returns a true for/askip "ancient webmock"' \
		-i spec/jira/client_spec.rb || die
}
