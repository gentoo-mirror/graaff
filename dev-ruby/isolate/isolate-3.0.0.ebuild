# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC="docs"

inherit ruby-fakegem

DESCRIPTION="Isolate is a very simple RubyGems sandbox."
HOMEPAGE="http://github.com/jbarnette/isolate"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_bdepend "dev-ruby/hoe
	test? ( dev-ruby/minitest )"
