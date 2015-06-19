# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRAINSTALL="VERSION"

inherit ruby-fakegem

DESCRIPTION="keeps fixtures synchronized with sources to prevent outdated fixtures going undetected."
HOMEPAGE="https://github.com/jsmestad/stale_fish"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests appear to be broken possibly to old yaml syntax.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/fakeweb <dev-ruby/activesupport-4.2:*"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' \
		-e '1i gem "activesupport", "<4.2"' spec/spec_helper.rb || die
}
