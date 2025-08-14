# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc UPGRADE.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="generators init.rb rails tasks"

RUBY_FAKEGEM_GEMSPEC="oauth-plugin.gemspec"

inherit ruby-fakegem

DESCRIPTION="A plugin for implementing OAuth Providers and Consumers in Rails applications."
HOMEPAGE="https://github.com/pelle/oauth-plugin"

LICENSE="MIT"
SLOT="0.4"
KEYWORDS="~amd64"
IUSE="doc"

PATCHES=( "${FILESDIR}/oauth-filter-action.patch" "${FILESDIR}/oauth-uri-escape.patch" )

ruby_add_rdepend "
	>=dev-ruby/oauth-0.4.4 =dev-ruby/oauth-0*
	>=dev-ruby/oauth2-0.5.0
	dev-ruby/rack:*
	dev-ruby/multi_json
"
ruby_add_bdepend "test? ( dev-ruby/rack-test )"

all_ruby_prepare() {
	# Avoid specs that fail with new hash ordering. Remove the whole
	# file because the specs as written are very brittle and can't be
	# handled individually.
	# https://github.com/pelle/oauth-plugin/issues/127
	rm spec/oauth/provider/authorizer_spec.rb || die

	# Avoid unneeded dependency on git.
	sed -i -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Loosen oauth dependency
	sed -i -e '/oauth/ s/0.4.4/0.4/' ${RUBY_FAKEGEM_GEMSPEC} || die

	# Fix compatibility with rspec 3
	sed -i -e 's/stub!/stub/' spec/rack/oauth_filter_spec.rb || die
}
