# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="README.markdown TODO.txt"
RUBY_FAKEGEM_DOCDIR="rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Make your Rails app 10 times faster in development mode"
HOMEPAGE="https://github.com/thedarkone/rails-dev-boost"
LICENSE="MIT"

SRC_URI="https://github.com/thedarkone/rails-dev-boost/tarball/216de40f33fe794e19c492c283d69d4911cab741 -> ${P}.tgz"
RUBY_S="thedarkone-rails-dev-boost-*"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
