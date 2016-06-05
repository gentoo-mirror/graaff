# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Generates Rails 3/4 model and controller UML diagrams"
HOMEPAGE="http://railroady.prestonlee.com"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-gfx/graphviz"

ruby_add_bdepend "test? ( dev-ruby/activesupport )"
