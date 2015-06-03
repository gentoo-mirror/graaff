# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_EXTRAINSTALL="VERSION"

inherit multilib ruby-fakegem

DESCRIPTION="Ruby-Stemmer exposes SnowBall API to Ruby."
HOMEPAGE="https://github.com/aurelian/ruby-stemmer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	rm -f Gemfile.lock || die
	sed -i -e '/bundler/ s:^:#:' test/helper.rb || die
}

each_ruby_configure() {
	${RUBY} -C ext/lingua extconf.rb || die
}

each_ruby_compile() {
	emake -C ext/lingua
	cp ext/lingua/stemmer_native$(get_modname) lib/lingua/ || die
}

each_ruby_test() {
	${RUBY} -Ilib:test test/lingua/test_stemmer.rb || die
}
