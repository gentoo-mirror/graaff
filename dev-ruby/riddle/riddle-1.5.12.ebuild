# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="HISTORY README.textile"

inherit ruby-fakegem

DESCRIPTION="An interface to the Sphinx search daemon."
HOMEPAGE="http://freelancing-gods.com/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1.3"
IUSE=""

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
