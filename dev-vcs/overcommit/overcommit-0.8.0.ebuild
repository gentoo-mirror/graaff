# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="config libexec template-dir"

inherit ruby-fakegem

DESCRIPTION="The Opinionated Git Hook Manager"
HOMEPAGE="http://causes.github.io/blog/2013/05/30/overcommit-the-opinionated-git-hook-manager/"
SRC_URI="https://github.com/causes/overcommit/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/childprocess-0.5.1"
