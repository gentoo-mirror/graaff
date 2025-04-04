# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_DOCDIR="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGES.md FEATURES OPTIONS.md README.md"

RUBY_FAKEGEM_GEMSPEC="brakeman.gemspec"

inherit ruby-fakegem

DESCRIPTION="Static analysis tool which checks RoR applications for security vulnerabilities"
HOMEPAGE="https://brakemanscanner.org/"
SRC_URI="https://github.com/presidentbeef/brakeman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BPUL"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/csv
	>=dev-ruby/erubis-2.6
	>=dev-ruby/haml-5.1:5
	dev-ruby/highline:3
	>=dev-ruby/parallel-1.20:1
	dev-ruby/prism:1
	dev-ruby/racc
	dev-ruby/rexml:3
	>=dev-ruby/ruby2ruby-2.5.1:2
	>=dev-ruby/ruby_parser-3.20.2 =dev-ruby/ruby_parser-3*
	>=dev-ruby/sexp_processor-4.7:4
	>=dev-ruby/slim-1.3.6:* <dev-ruby/slim-5.3:*
	|| ( dev-ruby/terminal-table:4 dev-ruby/terminal-table:3 dev-ruby/terminal-table:2 dev-ruby/terminal-table:0 )
"

ruby_add_bdepend "test? ( dev-ruby/bundler )"

all_ruby_prepare() {
	# Avoid seemingly harmless test failure
	sed -i -e '/test_number_of_warnings/askip "gentoo"' test/test.rb || die

	sed -e '/ruby_parser-legacy/ s:^:#:' \
		-e '/minitest-ci/ s:^:#:' \
		-e '/simplecov/ s:^:#:' \
		-e '/ruby_parser/ s/3.20.2/3.20/' \
		-e '/ruby2ruby/ s/2.5.1/2.5/' \
		-i gem_common.rb || die

	sed -i -e '/rake/ s/,.*$// ; /codeclimate/ s:^:#: ; /json/ s:^:#:' Gemfile || die

	# Avoid support for obsolete ruby versions
	sed -i -e '/ruby_parser\/legacy/ s:^:#:' lib/brakeman/scanner.rb || die
	rm -f test/tests/{markdown_output,rails2}.rb || die

	# Avoid obsolete test about rails 6.0.
	sed -i -e '/test_CVE_2020_8166_rails6/askip "rails 6.0 is deprecated now"' test/tests/cves.rb || die
}
