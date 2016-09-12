# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.rdoc"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="https://github.com/binarylogic/authlogic"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="3"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.2
	>=dev-ruby/activesupport-3.2
	>=dev-ruby/request_store-1.0.5
	>=dev-ruby/scrypt-2.0"
ruby_add_bdepend "test? ( >=dev-ruby/bcrypt-ruby-3.1.5 dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile || die

	sed -i -e '/scrypt/ s/1.2/2.0/' \
		-e '/ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}
