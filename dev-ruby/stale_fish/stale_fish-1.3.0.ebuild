# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRAINSTALL="VERSION"

inherit ruby-fakegem

DESCRIPTION="keeps fixtures synchronized with sources to prevent outdated fixtures going undetected."
HOMEPAGE="http://github.com/jsmestad/stale_fish"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests appear to be broken, possibly due to obsolete bundler syntax.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/fakeweb dev-ruby/activesupport"
