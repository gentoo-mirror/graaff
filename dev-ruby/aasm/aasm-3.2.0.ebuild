# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

# Requires sdoc which is not yet available in Gentoo.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A library for adding finite state machines to Ruby classes."
HOMEPAGE="https://github.com/rubyist/aasm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activerecord dev-ruby/shoulda dev-ruby/rr )"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -i -e '/coveralls/I s:^:#:' spec/spec_helper.rb || die

	# We currently don't package sdoc
	sed -i -e '/sdoc/d' Rakefile || die

	# Remove specs for code we won't use
	rm spec/unit/persistence/mongoid_persistance_spec.rb || die
}
