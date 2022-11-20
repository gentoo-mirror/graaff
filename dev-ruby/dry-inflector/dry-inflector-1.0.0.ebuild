# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="dry-inflector.gemspec"

inherit ruby-fakegem

DESCRIPTION="String inflections for dry-rb"

HOMEPAGE="https://dry-rb.org/gems/dry-inflector"
SRC_URI="https://github.com/dry-rb/dry-inflector/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/\(bundler\|coverage\)/ s/^/#/' spec/spec_helper.rb || die
}
