# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-activeldap/ruby-activeldap-1.2.2-r1.ebuild,v 1.3 2011/10/15 23:05:58 maekke Exp $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.textile TODO"
RUBY_FAKEGEM_EXTRAINSTALL="po"
RUBY_FAKEGEM_NAME="activeldap"

inherit ruby-fakegem

MY_P="${P/ruby-/}"
DESCRIPTION="Ruby/ActiveLDAP provides an activerecord inspired object oriented interface to LDAP"
HOMEPAGE="https://github.com/activeldap/activeldap"

LICENSE="GPL-2"
SLOT="3"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

# Most tests require a live LDAP server to run.
RESTRICT="test"

ruby_add_bdepend "dev-ruby/hoe"
ruby_add_bdepend "test? ( virtual/ruby-test-unit )"

# The activemodel dependency is 3.1.0.rc4 but we don't have that yet.
ruby_add_rdepend "
	>=dev-ruby/activemodel-3.0.10
	dev-ruby/locale
	dev-ruby/fast_gettext
	dev-ruby/gettext_i18n_rails
	|| ( >=dev-ruby/ruby-ldap-0.8.2 dev-ruby/ruby-net-ldap )"

all_ruby_prepare() {
	# "Fix" activemodel dependency to also work with Rails 3.0.
	sed -i -e 's/3.1.0.rc4/3.0.10/' ../metadata || die

	# Comment out Gettext setup because it does not work with fast_gettext. This
	# patch probably breaks ruby_gettext usage. See
	# https://github.com/activeldap/activeldap/issues/33
	sed -i -e '/GetText\./ s:^:#:' lib/active_ldap/get_text_support.rb || die
}

each_ruby_test() {
	# Tests use test-unit-2 which is currently masked in tree.
	# Version 2.0.6 is bundled so use that for now.
	RUBYLIB=test-unit/lib ${RUBY} -S rake test || die "Tests failed."
}

all_ruby_install() {
	all_fakegem_install

	dodoc doc/text/*

	insinto /usr/share/doc/${PF}
	doins -r examples
}
