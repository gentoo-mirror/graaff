# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby19"

inherit ruby-fakegem

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

# There are also features but these fail since we don't have all
# dependencies available (see below in ruby_prepare).
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="History.txt README.markdown TODO"

DESCRIPTION="A set of strategies for cleaning your database in Ruby."
HOMEPAGE="http://github.com/bmabey/database_cleaner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

# Tests fail for ruby19, figure this out later for newer versions.
# Tests also fail without mongoid, so skip for now.
RESTRICT=test

ruby_add_bdepend "test? ( dev-ruby/rake dev-ruby/rspec:0 )"

all_ruby_prepare() {
	# Remove specs for database providers we don't package yet.
	rm -rf spec/database_cleaner/{couch_potato,mongo,mongo_mapper,sequel} || die

	# Remove bundler support
	sed -i -e '/[Bb]undler/d' Rakefile spec/spec_helper.rb examples/features/support/env.rb || die "Unable to remove bundler support."
}

each_ruby_test() {
	${RUBY} -I. -S spec spec || die
}
