# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.md"

inherit ruby-fakegem

DESCRIPTION="This library provides iCalendar support for ruby. (RFC-2445)"
HOMEPAGE="http://github.com/icalendar/icalendar"
LICENSE="|| ( GPL-2 BSD Ruby )"
SRC_URI="https://github.com/icalendar/icalendar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="2"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/tzinfo-1.1:1 )"

all_ruby_prepare() {
	sed -i '/bundler/Id' Rakefile || die

	sed -i -e '/simplecov/,/end/ s:^:#:' spec/spec_helper.rb || die

	# Avoid one failing spec with TZ offset. May fail since we use the
	# overall timezone database, rather than tzinfo.
	sed -i -e '/daylight offset/,/^  end/ s:^:#:' spec/tzinfo_spec.rb || die
}
