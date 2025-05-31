# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md README.rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="zfstools.gemspec"

inherit ruby-fakegem

DESCRIPTION="ZFS scripts including zfs-auto-snapshot, clone of OpenSolaris auto snapshotting"
HOMEPAGE="https://github.com/bdrewery/zfstools"
SRC_URI="https://github.com/bdrewery/zfstools/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD-2"

SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	rm -f Gemfile.lock || die

	sed -i -e '/simplecov/ s:^:#:' -e '/SimpleCov/,/^end/ s:^:#:' spec/spec_helper.rb || die
}
