# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md GUIDE.md README.md"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="a Ruby 2 debugger"
HOMEPAGE="https://github.com/deivid-rodriguez/byebug"
SRC_URI="https://github.com/deivid-rodriguez/byebug/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? (
	dev-ruby/byebug
	dev-ruby/pry
)"

all_ruby_prepare() {
	sed -i -e '/coverage/ s:^:#:' test/test_helper.rb || die
	sed -i -e 's:__dir__:"'${S}'":' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_configure() {
	${RUBY} -Cext/byebug extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/byebug
	cp ext/byebug/byebug.so lib/byebug/ || die
}

each_ruby_test() {
	${RUBY} -r./script/minitest_runner -e MinitestRunner.new.run || die
}
