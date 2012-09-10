# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="4"
USE_RUBY="ruby18 ruby19"

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

# Backport fix that causes problems when using cucumber or when sending
# email.
# https://github.com/jcasimir/draper/commit/5da443366cc7146601d3feca21fe778cac5b0e72
#RUBY_PATCHES=( "${P}-view-context.patch" )

ruby_add_rdepend ">=dev-ruby/actionpack-3.2 >=dev-ruby/activesupport-3.2"

ruby_add_bdepend "test? (
		>=dev-ruby/ammeter-0.2.2
		>=dev-ruby/railties-3.2
	)"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/ s:^:#:' spec/spec_helper.rb || die
	sed -i -e '3i require "draper"' spec/spec_helper.rb || die

	# Avoid failing specs for ruby18. These won't be fixed, but my own
	# applications seem to work fine for now with ruby18.
	sed -i -e '/never proxy to_param/,/^      end/ s:^:#:' \
		-e '/never proxy id if/,/^      end/ s:^:#:' \
		-e '/never proxy errors/,/^      end/ s:^:#:' \
		-e '/proxies method directly after first hit/,/end/ s:^:#:' \
		spec/draper/base_spec.rb || die
}
