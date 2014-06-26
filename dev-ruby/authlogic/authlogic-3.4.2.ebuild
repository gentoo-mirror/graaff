# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="History README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="http://authlogic.rubyforge.org/"
LICENSE="Ruby"

KEYWORDS="~amd64"
SLOT="3"
IUSE=""

# Now requires scrypt but this is not packaged yet, see below.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/activerecord-3.2
	>=dev-ruby/activesupport-3.2
	>=dev-ruby/request_store-1.0.5"
ruby_add_bdepend "test? ( >=dev-ruby/bcrypt-ruby-3.1.5 dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' Rakefile || die

	#sed -i -e '/ruby-debug/d' test/test_helper.rb || die

	# Avoid test for a crypt provider we don't package. Also test with
	# bcrypt rather than scrypt. SCrypt is not easy to install due to a
	# very weird build system.
	sed -i -e 's/SCrypt/BCrypt/' test/fixtures/users.yml test/acts_as_authentic_test/password_test.rb || die
	rm test/crypto_provider_test/scrypt_test.rb test/acts_as_authentic_test/{password,persistence_token}_test.rb || die

	# Use a version of minitest compatible with rails
	sed -i -e '2igem "minitest", "~> 4.0"' test/test_helper.rb || die
}
