# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19 ree18"

inherit ruby-fakegem

RUBY_FAKEGEM_TASK_TEST="-Ilib test"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

DESCRIPTION="Capabilities for sorting and reordering a number of objects in a list."
HOMEPAGE="http://rake.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86-macos"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit dev-ruby/activerecord )"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/[Bb]undler/d' Rakefile || die
	sed -i -e '1,9d' test/helper.rb || die
}
