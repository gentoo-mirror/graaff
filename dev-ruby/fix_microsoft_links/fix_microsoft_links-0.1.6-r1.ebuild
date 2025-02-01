# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Fixes redirects to login pages when following links from a Microsoft application"
HOMEPAGE="https://github.com/spilliton/fix_microsoft_links"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/rack-1.1.1:*"
