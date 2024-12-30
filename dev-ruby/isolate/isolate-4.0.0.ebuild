# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Isolate is a very simple RubyGems sandbox."
HOMEPAGE="https://github.com/jbarnette/isolate"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/rubygems-1.8.2"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.5:5 )"

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'gem "minitest", "~>5.5"; Dir["test/test_*.rb"].each{ |f| require f }' || die
}
