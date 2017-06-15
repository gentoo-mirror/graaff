# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

# Specs are not provided in the gem
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="Easiest way to manage multi-environment settings in any ruby project"
HOMEPAGE="https://github.com/railsconfig/config"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/activesupport-3.0:*
	>=dev-ruby/deep_merge-1.1.1 =dev-ruby/deep_merge-1.1*
"
