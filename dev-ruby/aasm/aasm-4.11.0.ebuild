# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

# Requires sdoc which is not yet available in Gentoo.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md README_FROM_VERSION_3_TO_4.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A library for adding finite state machines to Ruby classes."
HOMEPAGE="https://github.com/rubyist/aasm"

LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/activerecord dev-ruby/rr )"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -i -e '/coveralls/I s:^:#:' spec/spec_helper.rb || die

	# We currently don't package sdoc
	sed -i -e '/sdoc/d' Rakefile || die

	# Avoid spec that requires unpackaged generator_spec
	rm -f spec/generators/{active_record,mongoid}_generator_spec.rb || die
}
