# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Analyze code for potentially uncalled / dead methods"
HOMEPAGE="https://github.com/seattlerb/debride"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	dev-ruby/path_expander:1
	>=dev-ruby/ruby_parser-3.6:3
	>=dev-ruby/sexp_processor-4.5:4
"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*.rb"].each { |f| require f }' || die
}
