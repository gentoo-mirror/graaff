# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC="docs"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Extension of the Authlogic library to add OpenID support."
HOMEPAGE="http://authlogic-oid.rubyforge.org/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86-macos"
SLOT="0"
IUSE=""

# Use a fork in the network that has many, many bug fixes and seems the
# most coherent fork
SRC_URI="https://github.com/whitequark/authlogic_openid/tarball/0a5b3772437ac0ebb3b5ecd7ce53f51688d60345 -> ${P}.tgz"
RUBY_S="whitequark-authlogic_openid-*"

# Tests use hardcoded path to authlogic
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/hoe )"

ruby_add_rdepend ">=dev-ruby/authlogic-2.0.13"

all_ruby_prepare() {
	# Remove reference to documenation template we don't have.
	sed -i -e 's/-T hanna//' Rakefile || die
}
