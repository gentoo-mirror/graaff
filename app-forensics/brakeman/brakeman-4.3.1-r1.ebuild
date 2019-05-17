# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGES.md FEATURES OPTIONS.md README.md"

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
	>=dev-ruby/highline-1.6.20:0
	>=dev-ruby/ruby2ruby-2.4.0 =dev-ruby/ruby2ruby-2.4*
	>=dev-ruby/ruby_parser-3.11.0 =dev-ruby/ruby_parser-3*
	>=dev-ruby/safe_yaml-1.0
	>=dev-ruby/sass-3.0:* <dev-ruby/sass-3.5:*
	>=dev-ruby/sexp_processor-4.7:4
	>=dev-ruby/slim-1.3.6:*
	>=dev-ruby/terminal-table-1.4.5 =dev-ruby/terminal-table-1*"

ruby_add_bdepend "test? ( dev-ruby/bundler )"

all_ruby_prepare() {
	# Avoid seemingly harmless test failure
	sed -i -e '/test_highline/askip "gentoo"' test/tests/pager.rb || die

	# Allow newer slim versions (original limit was because slim 3.0.8 requires ruby 2.0)
	# Also loosen some other dependencies that are out of date.
	sed -e '/slim/ s/3.0.8/5.0/' \
		-e '/ruby_parser/ s/3.11.0/3.11/' \
		-i gem_common.rb || die

	sed -i -e '/rake/ s/,.*$// ; /codeclimate/ s:^:#:' Gemfile || die
}
