# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Cross platform mac address determination for ruby"
HOMEPAGE="https://github.com/ahoward/macaddr"
LICENSE="Ruby"

SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/systemu-2.6.5 =dev-ruby/systemu-2.6*"
