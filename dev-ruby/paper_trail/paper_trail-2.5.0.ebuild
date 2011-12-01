# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="PaperTrail lets you track changes to your models' data."
HOMEPAGE="https://github.com/airblade/paper_trail"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Requires turn which we do not have packaged yet.
RESTRICT="test"

#ruby_add_bdepend "test? ( dev-ruby/shoulda dev-ruby/sqlite3-ruby dev-ruby/capybara dev-ruby/turn )"

ruby_add_rdepend "=dev-ruby/rails-3*"
