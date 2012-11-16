# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

# Requires rails 3.0.9 so skip this for now.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Exception Notifier Plugin for Rails"
HOMEPAGE="https://github.com/smartinez87/exception_notification/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/actionmailer-3.0.4"

all_ruby_prepare() {
	# Remove campfire support. We don't need it and it bloats the
	# application. https://github.com/smartinez87/exception_notification/issues/101
	sed -i -e '/tinder/d' ${PN}.gemspec || die
}
