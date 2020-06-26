# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26 ruby27"

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

	sed -i -e '/simplecov/ s:^:#:' -e '/SimpleCov/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
