# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_RECIPE_DOC="none"

# Requires appraisal so skip this for now.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Exception Notifier Plugin for Rails"
HOMEPAGE="https://github.com/smartinez87/exception_notification/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="4"
IUSE="doc"

ruby_add_rdepend "
	>=dev-ruby/actionmailer-4:* <dev-ruby/actionmailer-8:*
	>=dev-ruby/activesupport-4:* <dev-ruby/activesupport-8:*"
