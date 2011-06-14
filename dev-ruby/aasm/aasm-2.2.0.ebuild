# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

# Requires sdoc which is not yet available in Gentoo.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

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

ruby_add_bdepend "test? ( dev-ruby/rspec:0 dev-ruby/shoulda )"

all_ruby_prepare() {
	# Remove jeweler checks since not all dependencies will be present.
	sed -i -e '/check_dependencies/d' Rakefile || die
}
