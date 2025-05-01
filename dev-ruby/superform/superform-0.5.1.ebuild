# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="sig"
RUBY_FAKEGEM_GEMSPEC="superform.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A better way to customize and build forms for your Rails application"
HOMEPAGE="https://github.com/rubymonolith/superform"
SRC_URI="https://github.com/rubymonolith/superform/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/phlex-rails:1
	>=dev-ruby/zeitwerk-2.6:2
"

all_ruby_prepare() {
	sed -e 's:_relative ": "./:' \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
