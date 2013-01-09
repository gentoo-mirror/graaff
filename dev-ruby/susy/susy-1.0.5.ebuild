# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.mkdn README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="sass templates VERSION"

inherit ruby-fakegem

DESCRIPTION="A semantic CSS grid system with a responsive twist"
HOMEPAGE="http://susy.oddbird.net"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/compass-0.12.2
	>=dev-ruby/sass-3.2.0"
