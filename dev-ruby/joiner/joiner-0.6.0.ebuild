# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Builds ActiveRecord joins from association paths"
HOMEPAGE="https://freelancing-gods.com/thinking-sphinx/"
LICENSE="MIT"

SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/activerecord-6.1.0:*"

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
