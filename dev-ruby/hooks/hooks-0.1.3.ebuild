# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="3"
USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Generic hooks with callbacks for Ruby."
HOMEPAGE="https://github.com/apotonick/hooks"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_bdepend "test? (
		virtual/ruby-test-unit
		dev-ruby/shoulda
		dev-ruby/activesupport
	)"

all_ruby_prepare() {
	# Remove bundler support
	rm Gemfile Gemfile.lock || die
	sed -i -e '/[Bb]undler/d' test/test_helper.rb
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb test/*_test.rb || die
}
