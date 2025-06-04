# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="vault.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Ruby API client for interacting with a Vault server"
HOMEPAGE="https://github.com/hashicorp/vault-ruby"
SRC_URI="https://github.com/hashicorp/vault-ruby/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="vault-ruby-${PV}"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="test? ( app-admin/vault )"

ruby_add_rdepend "
	dev-ruby/aws-sigv4
"

ruby_add_bdepend "test? (
	>=dev-ruby/aws-sigv4-1.1.4
	dev-ruby/webmock
)"

all_ruby_prepare() {
	# Avoid integration specs that require a running vault
	rm -f spec/integration/redirection_spec.rb spec/integration/api/logical_spec.rb || die
}
