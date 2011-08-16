# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

inherit ruby-fakegem

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

DESCRIPTION="This library adds simple versioning to an ActiveRecord module."
HOMEPAGE="http://rubyforge.org/projects/ar-versioned"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit dev-ruby/sqlite3-ruby )"

ruby_add_rdepend "dev-ruby/activerecord:3.0"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile test/abstract_unit.rb || die
}
