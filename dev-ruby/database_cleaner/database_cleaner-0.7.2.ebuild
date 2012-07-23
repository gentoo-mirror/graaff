# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18 jruby"

inherit ruby-fakegem

RUBY_FAKEGEM_TASK_DOC=""

# There are also features but these fail since we don't have all
# dependencies available (see below in ruby_prepare).
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="History.txt README.textile TODO"

DESCRIPTION="A set of strategies for cleaning your database in Ruby."
HOMEPAGE="http://github.com/bmabey/database_cleaner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

# Tests fail for ruby19, figure this out later for newer versions.
RESTRICT=test

ruby_add_bdepend "test? ( dev-ruby/rake dev-ruby/rspec:0 )"

all_ruby_prepare() {
	# Remove specs for database providers we don't package yet.
	rm -rf spec/database_cleaner/{couch_potato,mongo_mapper,sequel} || die

	# Remove bundler support
	sed -i -e '/[Bb]undler/d' Rakefile spec/spec_helper.rb examples/features/support/env.rb || die "Unable to remove bundler support."

	# Remove rspec options that are not needed for us and which require
	# ruby-debug.
	rm spec/spec.opts || die
}

each_ruby_test() {
	${RUBY} -I. -S spec spec || die
}
