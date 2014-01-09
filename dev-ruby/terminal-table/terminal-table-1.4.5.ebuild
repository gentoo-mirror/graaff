# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc Todo.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC="" # Currently broken

inherit ruby-fakegem

DESCRIPTION="Simple, feature rich ascii table generation library"
HOMEPAGE="http://github.com/visionmedia/terminal-table"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

# Test failures: https://github.com/visionmedia/terminal-table/issues/33
RESTRICT="test"

ruby_add_bdepend "test? ( dev-ruby/term-ansicolor )"
