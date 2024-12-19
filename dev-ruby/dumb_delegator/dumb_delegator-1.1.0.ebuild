# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="dumb_delegator.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="DumbDelegator delegates nearly everything to the wrapped object"
HOMEPAGE="https://github.com/stevenharman/dumb_delegator"
SRC_URI="https://github.com/stevenharman/dumb_delegator/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -e 's/git ls-files -z/find * -print0/' \
		-e 's/__dir__/"."/' \
		-e 's/__FILE__/"dumb_delegator.gemspec"/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '/pry/ s:^:#:' spec/spec_helper.rb || die
}
