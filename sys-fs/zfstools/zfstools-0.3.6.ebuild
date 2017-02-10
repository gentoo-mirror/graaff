# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md README.rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="ZFS scripts including zfs-auto-snapshot, clone of OpenSolaris auto snapshotting"
HOMEPAGE="https://github.com/bdrewery/zfstools"
SRC_URI="https://github.com/bdrewery/zfstools/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD-2"

KEYWORDS="~amd64"
SLOT="0"

all_ruby_prepare() {
	rm -f Gemfile.lock || die
}
