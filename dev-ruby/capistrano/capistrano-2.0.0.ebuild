# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/capistrano/capistrano-1.99.3.ebuild,v 1.1 2007/06/29 05:45:38 nichoj Exp $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="A distributed application deployment system"
HOMEPAGE="http://capify.org/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~ia64 ~ppc64 ~x86"
IUSE=""
#RESTRICT="test"

DEPEND=">=dev-lang/ruby-1.8.2
	app-admin/eselect-rails
	>=dev-ruby/rake-0.7.0
	>=dev-ruby/net-ssh-1.0.10
	>=dev-ruby/net-sftp-1.1.0
	>=dev-ruby/highline-1.2.7"

pkg_postinst() {
	ewarn "If you are upgrading from <capistrano-1.99, you should convert your"
	ewarn "project. See http://capify.org/upgrade"
	ewarn
}

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
