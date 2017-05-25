# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGES FEATURES README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_GEMSPEC="brakeman.gemspec"

inherit ruby-fakegem

DESCRIPTION="Static analysis tool which checks RoR applications for security vulnerabilities"
HOMEPAGE="http://brakemanscanner.org/"
SRC_URI="https://github.com/presidentbeef/brakeman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/erubis-2.6
	>=dev-ruby/haml-3.0:*  <dev-ruby/haml-5:*
	>=dev-ruby/highline-1.6.20 =dev-ruby/highline-1*
	>=dev-ruby/ruby2ruby-2.3.0 <dev-ruby/ruby2ruby-2.4.0
	>=dev-ruby/ruby_parser-3.9.0 =dev-ruby/ruby_parser-3*
	>=dev-ruby/safe_yaml-1.0
	>=dev-ruby/sass-3.0:* =dev-ruby/sass-3*:*
	>=dev-ruby/slim-1.3.6 <dev-ruby/slim-3.0.8
	>=dev-ruby/terminal-table-1.4.5 =dev-ruby/terminal-table-1*"

each_ruby_test() {
	${RUBY} test/test.rb || die
}
