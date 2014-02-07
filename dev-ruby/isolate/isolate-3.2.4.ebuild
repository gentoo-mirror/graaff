# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Isolate is a very simple RubyGems sandbox."
HOMEPAGE="http://github.com/jbarnette/isolate"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/rubygems-1.8.2"

ruby_add_bdepend "test? ( dev-ruby/minitest:5 )"

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'gem "minitest", "~>5.0"; Dir["test/test_*.rb"].each{ |f| require f }' || die
}
