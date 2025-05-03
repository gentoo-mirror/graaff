# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="SSHKit extension, for sudo operation with password input"
HOMEPAGE="https://github.com/kentaroi/sshkit-sudo"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

PATCHES=( "${FILESDIR}/sshkit-0.1.0-multiple-servers.patch" )

ruby_add_rdepend ">=dev-ruby/sshkit-1.8"
