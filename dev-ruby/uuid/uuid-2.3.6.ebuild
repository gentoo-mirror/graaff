# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

# uuid uses this to determine its version number.
RUBY_FAKEGEM_EXTRAINSTALL="uuid.gemspec"

inherit ruby-fakegem

DESCRIPTION="Generates universally unique identifiers (UUIDs) for use in distributed applications"
HOMEPAGE="http://github.com/assaf/uuid"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/macaddr-1.0:0"

all_ruby_prepare() {
	sed -i -e 's:"/tmp":ENV["TMP"]:' test/test-uuid.rb || die

	rm bin/{rake,yard,yri,yardoc} || die
}
