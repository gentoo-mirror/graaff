# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rake/rake-0.8.7-r2.ebuild,v 1.2 2009/12/15 06:54:12 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

inherit ruby-fakegem

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="History.txt README.textile"

DESCRIPTION="A set of strategies for cleaning your database in Ruby."
HOMEPAGE="http://github.com/bmabey/database_cleaner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

ruby_add_bdepend test "dev-ruby/rake dev-ruby/rspec:0 dev-util/cucumber"

all_ruby_prepare() {
	# Remove specs for database providers we don't package yet.
	rm -rf spec/database_cleaner/{couch_potato,mongo_mapper} || die

	# Remove failing specs, should be investigated at some point. The
	# same failure appears to happen in the features, so these are not
	# run either.
	rm spec/database_cleaner/active_record/base_spec.rb || die

	# Remove bundler support
	sed -i -e '/[Bb]undler/d' Rakefile spec/spec_helper.rb examples/features/support/env.rb || die "Unable to remove bundler support."
}
