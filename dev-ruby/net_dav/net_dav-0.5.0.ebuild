# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/xml-simple/xml-simple-1.0.15.ebuild,v 1.1 2011/04/11 05:36:25 graaff Exp $

EAPI=2
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="Net::Dav library, in the style of Net::HTTP"
HOMEPAGE="https://github.com/devrandom/net_dav/wiki"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Restrict tests since we miss the webrick-webdav dependency.
RESTRICT="test"

ruby_add_bdepend "test? ( >=dev-ruby/rspec-1.2.0:0 )"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.3.0"

all_ruby_prepare() {
	sed -i -e '/check_dependencies/d' Rakefile || die
}
