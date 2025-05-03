# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Scrypt password hashing algorithm"
HOMEPAGE="https://github.com/pbhogan/scrypt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_bdepend ">=dev-ruby/ffi-compiler-1.0.0"

all_ruby_prepare() {
	# In Gentoo ffi-compiler can be a built-time only dependency.
	sed -i -e '/ffi-compiler/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_compile() {
	# This task ignores CFLAGS and LDFLAGS and hardcodes sse and sse2
	# support. This should be fixed before moving it to the gentoo tree.
	${RUBY} -Cext/scrypt -S rake || die
	cp ext/scrypt/*/libscrypt_ext.so lib/
}

each_ruby_install() {
	each_fakegem_install
	ruby_fakegem_extensions_installed
}
