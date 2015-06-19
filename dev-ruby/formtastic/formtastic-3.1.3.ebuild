# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.textile"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="a Rails FormBuilder DSL (with some other goodies) to make it far easier to create forms."
HOMEPAGE="https://github.com/justinfrench/formtastic"

LICENSE="MIT"
SLOT="3.1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.2.13:*"

all_ruby_prepare() {
	# Remove silly deprecation message that cannot be avoided.
	sed -e '/deprecated_version_of_rails/,/end/ s:^:#:' -i lib/formtastic.rb || die
}
