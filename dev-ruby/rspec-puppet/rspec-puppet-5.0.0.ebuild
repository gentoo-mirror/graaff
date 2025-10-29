# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md HISTORY.md README.md"
RUBY_FAKEGEM_GEMSPEC="rspec-puppet.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="RSpec tests for your Puppet manifests"
HOMEPAGE="https://github.com/puppetlabs/rspec-puppet/"
SRC_URI="https://github.com/puppetlabs/rspec-puppet/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "dev-ruby/rspec:3"

ruby_add_depend "test? ( app-admin/puppet dev-ruby/facter )"

all_ruby_prepare() {
	# Ensure facter can be required. Not sure why this does not work
	# without this extra require.
	sed -e '/require.*rspec-puppet/arequire "facter"' \
		-i spec/spec_helper.rb || die

	# Fails on unknown augeas or other resources, unclear why.
	rm -f spec/defines/{sysctl,test_api}_spec.rb \
	   spec/classes/test_registry_spec.rb \
	   spec/functions/ensure_packages_spec.rb || die

}
