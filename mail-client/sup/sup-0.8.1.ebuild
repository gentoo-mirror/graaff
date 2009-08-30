# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/hpricot/hpricot-0.8.ebuild,v 1.2 2009/05/09 12:24:23 flameeyes Exp $

EAPI=2

inherit gems

USE_RUBY="ruby18"

DESCRIPTION="Sup is a console-based email client for people with a lot of email."
HOMEPAGE="http://sup.rubyforge.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# We require a newer ncurses than the gem since this is the first
# version in our tree that works with gems at all.
DEPEND=">=dev-ruby/ruby-ferret-0.11.6
	>=dev-ruby/ncurses-ruby-1.2.3-r1
	>=dev-ruby/rmail-0.17
	dev-ruby/highline
	dev-ruby/net-ssh
	>=dev-ruby/trollop-1.12
	dev-ruby/lockfile
	=dev-ruby/mime-types-1*
	dev-ruby/ruby-gettext
	dev-ruby/fastthread"
RDEPEND="${DEPEND}"

src_install() {
	gems_src_install

	# Remove a file that is already provided by ncurses and that works
	# slightly different for us.
	find "${D}" -name ncurses.rb -delete
}
