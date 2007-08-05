# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/capistrano/capistrano-1.4.1.ebuild,v 1.6 2007/04/16 08:50:14 opfer Exp $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="A distributed application deployment system"
HOMEPAGE="http://rubyforge.org/projects/capistrano/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ia64 ppc64 x86"
IUSE=""
#RESTRICT="test"

DEPEND=">=dev-lang/ruby-1.8.2
	app-admin/eselect-rails
	>=dev-ruby/rake-0.7.0
	>=dev-ruby/net-ssh-1.0.10
	>=dev-ruby/net-sftp-1.1.0"

src_install() {
	gems_src_install

	# Rename slotted files so that eselect can handle them
	mv "${D}"/usr/bin/cap "${D}"/usr/bin/cap-${PV}
	mv "${D}"/"${GEMSDIR}"/bin/cap "${D}"/"${GEMSDIR}"/bin/cap-${PV}
}

pkg_postint() {
	eselect cap update --if-unset
}

pkg_postrm() {
	eselect cap update --if-unset
}
