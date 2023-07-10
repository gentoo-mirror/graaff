# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="HISTORY README.markdown"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="An interface to the Sphinx search daemon."
HOMEPAGE="https://freelancing-gods.com/riddle/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1.3"
IUSE=""

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
