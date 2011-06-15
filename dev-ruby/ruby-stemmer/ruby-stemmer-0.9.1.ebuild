# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_EXTRAINSTALL="VERSION"

inherit multilib ruby-fakegem

DESCRIPTION="Ruby-Stemmer exposes SnowBall API to Ruby."
HOMEPAGE="https://github.com/aurelian/ruby-stemmer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "dev-ruby/jeweler"

each_ruby_configure() {
	${RUBY} -C ext/lingua extconf.rb || die
}

each_ruby_compile() {
	emake -C ext/lingua
	cp ext/lingua/stemmer_native$(get_modname) lib/lingua/ || die
}
