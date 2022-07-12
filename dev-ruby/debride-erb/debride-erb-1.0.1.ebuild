# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Extends debride to analyze erb files (erubis ala rails, actually)"
HOMEPAGE="https://github.com/seattlerb/debride-erb"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/debride-1.2:1
	=dev-ruby/erubis-2.7*
"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*.rb"].each { |f| require f }' || die
}
