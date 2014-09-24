# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="docs/changelog.rst README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="sass templates VERSION"

inherit ruby-fakegem

DESCRIPTION="A semantic CSS grid system with a responsive twist"
HOMEPAGE="http://susy.oddbird.net"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3.0 <dev-ruby/sass-3.5"
