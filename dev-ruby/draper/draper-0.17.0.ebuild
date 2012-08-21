# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="4"
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.markdown Readme.markdown"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="View Models for Rails"
HOMEPAGE="https://github.com/jcasimir/draper"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/actionpack-3.2 >=dev-ruby/activesupport-3.2"

ruby_add_bdepend "test? (
		dev-ruby/rspec:2
		>=dev-ruby/ammeter-0.2.2
		>=dev-ruby/railties-3.2
	)"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/ s:^:#:' spec/spec_helper.rb || die
	sed -i -e '3i require "draper"' spec/spec_helper.rb || die

	# Avoid failing specs for now, possibly report them next release.
#	sed -i -e '232,244 s:^:#:' spec/draper/base_spec.rb || die
}
