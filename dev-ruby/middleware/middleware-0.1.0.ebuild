# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md user_guide.md"

inherit ruby-fakegem

DESCRIPTION="Generalized implementation of the middleware abstraction for Ruby"
HOMEPAGE="https://github.com/mitchellh/middleware"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	# Avoid test failing with rspec 2.14+
	sed -i -e '/should raise an error if an invalid middleware is given/,/^  end/ s:^:#:' spec/middleware/runner_spec.rb
}
