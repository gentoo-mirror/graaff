# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="CHANGES README.textile"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Modern continuous testing (flexible alternative to Autotest)"
HOMEPAGE="http://mynyml.com/ruby/flexible-continuous-testing"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/iobuffer-0.1.0"

each_ruby_configure() {
	pushd ext/rev
	${RUBY} extconf.rb || die "Unable to configure rev extionsion."
	popd

	pushd ext/http11_client
	${RUBY} extconf.rb || die "Unable to configure http11 extension."
	popd
}

each_ruby_compile() {
	pushd ext/rev
	emake || die "Unable to compile rev extension."
	popd

	pushd ext/http11_client
	emake || die "Unable to compile http11 extension."
	popd
}

each_ruby_install() {
	cp ext/rev/rev_ext.so lib
	cp ext/http11_client/http11_client.so lib

	each_fakegem_install
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}/examples
	doins examples/* || die "Unable to install examples."
}
