# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="README.markdown TODO.txt"
RUBY_FAKEGEM_DOCDIR="rdoc"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Make your Rails app 10 times faster in development mode"
HOMEPAGE="https://github.com/thedarkone/rails-dev-boost"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
