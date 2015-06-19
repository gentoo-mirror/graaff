# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby19 jruby"

RUBY_FAKEGEM_TASK_TEST=""

# requires jeweler/ad_agency
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="docs/* History.txt README.txt"

inherit ruby-fakegem

DESCRIPTION="A new Ruby implementation of RFC2445 iCalendar."
HOMEPAGE="http://github.com/rubyredrick/ri_cal"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RUBY_PATCHES=( ${P}-rails32.patch )

# This gem can use either tzinfo or activesupport and thus doesn't have
# any explicit dependency. We always depend on tzinfo since newer
# versions of activesupport do this as well.
ruby_add_rdepend "dev-ruby/tzinfo"

ruby_add_bdepend "test? ( dev-ruby/rspec:0 )"

each_ruby_test() {
	${RUBY} -S spec spec || die
}
