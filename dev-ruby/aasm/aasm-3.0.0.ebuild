# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

# Requires sdoc which is not yet available in Gentoo.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST="test spec"

inherit ruby-fakegem

DESCRIPTION="A library for adding finite state machines to Ruby classes."
HOMEPAGE="https://github.com/rubyist/aasm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#  rspec (>= 0, development)
#  shoulda (>= 0, development)

ruby_add_rdepend "dev-ruby/activerecord"
ruby_add_bdepend "test? ( dev-ruby/rspec:2 dev-ruby/shoulda dev-ruby/rr )"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die

	# We currently don't package sdoc
	sed -i -e '/sdoc/d' Rakefile || die
}
