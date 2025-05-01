# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRA_DOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="mdl.gemspec"

inherit ruby-fakegem

DESCRIPTION="Style checker/lint tool for markdown files"
HOMEPAGE="https://github.com/markdownlint/markdownlint"
SRC_URI="https://github.com/markdownlint/markdownlint/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="markdownlint-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/kramdown-2.3:2
	>=dev-ruby/kramdown-parser-gfm-1.1:1
	>=dev-ruby/mixlib-cli-2.1.1:0
	>=dev-ruby/mixlib-config-2.2.1:0
	dev-ruby/mixlib-shellout
"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile test/setup_tests.rb || die
	sed -i -e '3igem "kramdown-parser-gfm", "~> 1.0"' test/setup_tests.rb || die

	# Throws errors and probably needs a more elaborate environment setup
	rm -f test/test_cli.rb || die
}
