# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.md"

RUBY_FAKEGEM_GEMSPEC="icalendar.gemspec"

inherit ruby-fakegem

DESCRIPTION="This library provides iCalendar support for ruby. (RFC-2445)"
HOMEPAGE="https://github.com/icalendar/icalendar"
LICENSE="|| ( GPL-2 BSD Ruby )"
SRC_URI="https://github.com/icalendar/icalendar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ice_cube-0.16:0"

ruby_add_bdepend "test? ( >=dev-ruby/tzinfo-1.2:1 )"

all_ruby_prepare() {
	sed -i '/bundler/Id' Rakefile || die

	sed -i -e '/simplecov/,/end/ s:^:#:' spec/spec_helper.rb || die

	# Avoid one failing spec with TZ offset. May fail since we use the
	# overall timezone database, rather than tzinfo.
	sed -i -e '/no end transition/,/^  end/ s:^:#:' spec/tzinfo_spec.rb || die
}
