# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="none"

inherit ruby-fakegem

DESCRIPTION="rspec command for spring"
HOMEPAGE="https://github.com/jonleighton/spring-commands-rspec"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"

IUSE=""

ruby_add_rdepend ">=dev-ruby/spring-0.9.1"
