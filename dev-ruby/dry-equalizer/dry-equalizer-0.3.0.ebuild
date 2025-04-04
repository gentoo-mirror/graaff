# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="dry-equalizer.gemspec"

inherit ruby-fakegem

DESCRIPTION="Module to define equality, equivalence and inspection methods"

HOMEPAGE="https://dry-rb.org/gems/dry-equalizer/"
SRC_URI="https://github.com/dry-rb/dry-equalizer/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -e 's/git ls-files --/find/' -e 's/git ls-files/find */' -i ${RUBY_FAKEGEM_GEMSPEC} || die
}
