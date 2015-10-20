# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="SSHKit extension, for sudo operation with password input"
HOMEPAGE="https://github.com/kentaroi/sshkit-sudo"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RUBY_PATCHES=( ${P}-Password.patch )

ruby_add_rdepend "dev-ruby/sshkit"
