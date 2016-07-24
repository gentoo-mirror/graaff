# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Builds ActiveRecord joins from association paths"
HOMEPAGE="http://pat.github.io/thinking-sphinx"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.3"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.1.0:*"

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
