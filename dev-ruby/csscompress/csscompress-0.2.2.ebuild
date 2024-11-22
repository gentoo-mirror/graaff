# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="sig"
RUBY_FAKEGEM_GEMSPEC="csscompress.gemspec"

inherit ruby-fakegem

DESCRIPTION="CSS minification with Ruby using ExecJS and Node.js' CSSO."
HOMEPAGE="https://github.com/domchristie/csscompress"
SRC_URI="https://github.com/domchristie/csscompress/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/execjs-2.8:0"

all_ruby_prepare() {
	sed -e '/\(bundler\|standard\)/ s:^:#:' \
		-i Rakefile || die

	sed -e 's:_relative ": "./:' \
		-e 's/__dir__/"."/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	# Avoid useless output to stdout when used.
	sed -e '/puts/ s:^:#:' \
		-i lib/csscompress/sprockets.rb || die
}
