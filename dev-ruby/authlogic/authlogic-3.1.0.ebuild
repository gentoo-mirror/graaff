# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=2

USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb VERSION.yml generators rails"

inherit ruby-fakegem

DESCRIPTION="A clean, simple, and unobtrusive ruby authentication solution."
HOMEPAGE="http://authlogic.rubyforge.org/"
LICENSE="Ruby"

KEYWORDS="~amd64 ~x86"
SLOT="3"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.0.7"
ruby_add_bdepend "test? ( dev-ruby/bcrypt-ruby dev-ruby/ruby-debug dev-ruby/sqlite3-ruby )"

# This approach makes it possible to ignore jeweler.
each_ruby_test() {
	${RUBY} -Ilib:test -rtest/unit -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
