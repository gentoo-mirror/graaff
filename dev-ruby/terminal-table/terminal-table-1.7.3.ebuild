# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc Todo.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC="" # Currently broken

inherit ruby-fakegem

DESCRIPTION="Simple, feature rich ascii table generation library"
HOMEPAGE="https://github.com/tj/terminal-table"
SRC_URI="https://github.com/tj/terminal-table/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

# Test failures: https://github.com/visionmedia/terminal-table/issues/33
#RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/unicode-display_width-1.1:1"

ruby_add_bdepend "test? ( dev-ruby/term-ansicolor )"
