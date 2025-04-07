# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="atlassian-jwt.gemspec"

inherit ruby-fakegem

DESCRIPTION="Simplifies generating the claims needed with the Atlassian Connect REST APIs"
HOMEPAGE="https://bitbucket.org/atlassian/atlassian-jwt-ruby"
SRC_URI="https://bitbucket.org/atlassian/atlassian-jwt-ruby/get/v${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RUBY_S="atlassian-${PN}-ruby-*"

ruby_add_rdepend ">=dev-ruby/jwt-2.1.0:2"
