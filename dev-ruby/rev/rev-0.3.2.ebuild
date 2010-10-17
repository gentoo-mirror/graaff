# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="CHANGES README.textile"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Rev is an event library for Ruby, built on the libev event library."
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
	# We have injected --no-undefined in Ruby as a safety precaution
	# against broken ebuilds, but these bindings unfortunately rely on
	# the lazy load of other extensions; see bug #320545.
	find . -name Makefile -print0 | xargs -0 \
		sed -i -e 's:-Wl,--no-undefined::' || die "--no-undefined removal failed"
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
