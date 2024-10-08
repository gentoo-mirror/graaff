# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Extends debride to analyze erb files (erubis ala rails, actually)"
HOMEPAGE="https://github.com/seattlerb/debride-erb"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/debride-1.2:1
	>=dev-ruby/erubi-1.10:0
"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*.rb"].each { |f| require f }' || die
}
