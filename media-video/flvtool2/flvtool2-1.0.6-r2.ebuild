# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

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
