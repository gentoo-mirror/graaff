# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem versionator

DESCRIPTION="Use libsass with Ruby"
HOMEPAGE="https://github.com/sass/sassc-ruby"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

RDEPEND+=">=dev-libs/libsass-3.4.2"

ruby_add_rdepend "
	dev-ruby/bundler
	>=dev-ruby/ffi-1.9.6
	>=dev-ruby/sass-3.3.0:*
"

all_ruby_prepare() {
	# Use unbundled libsass
	rm -rf ext || die

	sed -i -e '/spec =/,/ffi_lib/ s:^:#:' \
		-e '/ffi_lib/a    ffi_lib "/usr/lib64/libsass.so"' \
		lib/sassc/native.rb || die

	# Avoid version-specific test so newer libsass versions can be used.
	sed -i -e '/test_it_reports_the_libsass_version/,/end/ s:^:#:' test/native_test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:.:test -e 'Dir["test/**/*_test.rb"].each{|f| require f}' || die
}
