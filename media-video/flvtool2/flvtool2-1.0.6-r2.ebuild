# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="a manipulation tool for Macromedia Flash Video files (FLV)."
HOMEPAGE="http://rubyforge.org/projects/flvtool2/"
LICENSE="BSD"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""
