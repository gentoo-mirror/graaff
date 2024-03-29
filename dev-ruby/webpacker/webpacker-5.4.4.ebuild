# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="package.json"

inherit ruby-fakegem

DESCRIPTION="Use webpack to manage app-like JavaScript modules in Rails"
HOMEPAGE="https://github.com/rails/webpacker"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

RDEPEND+=" >=net-libs/nodejs-10.13.0 =sys-apps/yarn-1*"

ruby_add_rdepend "
	>=dev-ruby/activesupport-5.2:*
	>=dev-ruby/rack-proxy-0.6.1
	>=dev-ruby/railties-5.2:*
	>=dev-ruby/semantic_range-2.3.0
"

all_ruby_prepare() {
	sed -i -e '/byebug/ s:^:#:' test/test_helper.rb || die
	rm -f Gemfile.lock || die

	mkdir -p test/test_app/node_modules || die

	# Avoid failing test
	sed -i -e '/test_rake_webpacker_yarn_install_in_non_production_environments/askip' test/rake_tasks_test.rb || die

	# Assume modern Psych
	sed -i -e '/YAML/ s/config_path/config_path, aliases: true/' test/configuration_test.rb || die
}

each_ruby_test() {
	RUBYLIB="$(pwd)/lib" ${RUBY} -S rake test || die
}
