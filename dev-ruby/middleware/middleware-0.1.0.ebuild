# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby18 ruby19"

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

# Fails a test with latest rspec (2.14)
RESTRICT="test"
