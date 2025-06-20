# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Analyze code for potentially uncalled / dead methods"
HOMEPAGE="https://github.com/seattlerb/debride"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/path_expander:1
	>=dev-ruby/ruby_parser-3.20:3
	>=dev-ruby/sexp_processor-4.17:4
"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*.rb"].each { |f| require f }' || die
}
