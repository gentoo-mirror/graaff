# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="build examples ext"

inherit ruby-fakegem

DESCRIPTION="Boot any rails app in under a second"
HOMEPAGE="http://zeus.is/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/method_source-0.6.7"

each_ruby_configure() {
	${RUBY} -Cext/inotify-wrapper extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/inotify-wrapper V=1
}

each_ruby_install() {
	each_fakegem_install

	find "${D}" -name build -print | xargs chmod -R a+x
	find "${D}" -name inotify-wrapper -print | xargs chmod a+x
}
