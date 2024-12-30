# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTENSIONS=(ext/extconf.rb)
RUBY_FAKEGEM_EXTRADOC="README TODO"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="ext"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for the Kerberos library"
HOMEPAGE="http://rubyforge.org/projects/krb5-auth/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND} virtual/krb5"
RDEPEND="${RDEPEND} virtual/krb5"

all_ruby_prepare() {
	eapply -p0 "${FILESDIR}/${P}-ruby19.patch"

	default
}
