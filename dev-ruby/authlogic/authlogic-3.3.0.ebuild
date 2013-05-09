# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="http://authlogic.rubyforge.org/"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="3"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.2"
ruby_add_bdepend "test? ( dev-ruby/bcrypt-ruby dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile || die

	#sed -i -e '/ruby-debug/d' test/test_helper.rb || die

	# Avoid test for a crypt provider we don't package
	rm test/crypto_provider_test/scrypt_test.rb || die
}
