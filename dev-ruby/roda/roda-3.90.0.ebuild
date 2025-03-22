# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_GEMSPEC="roda.gemspec"

inherit ruby-fakegem

DESCRIPTION="Routing tree web toolkit"
HOMEPAGE="https://roda.jeremyevans.net/"
SRC_URI="https://github.com/jeremyevans/roda/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "dev-ruby/rack:*"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.7.0 dev-ruby/minitest-global_expectations dev-ruby/tilt )"
