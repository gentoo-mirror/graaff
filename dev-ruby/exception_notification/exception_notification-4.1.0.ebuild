# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

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
SLOT="4"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/actionmailer-3.0.4 >=dev-ruby/activesupport-3.0.4"
