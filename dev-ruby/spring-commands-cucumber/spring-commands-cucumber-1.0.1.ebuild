# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="cucumber command for spring"
HOMEPAGE="https://github.com/jonleighton/spring-commands-cucumber"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"

IUSE=""

ruby_add_rdepend ">=dev-ruby/spring-0.9.1"
