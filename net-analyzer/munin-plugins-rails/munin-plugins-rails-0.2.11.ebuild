# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="munin"

inherit ruby-fakegem

DESCRIPTION="Collection of Concise Munin plugins for Rails server environments."
HOMEPAGE="http://barttenbrinke.github.com/munin-plugins-rails/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
