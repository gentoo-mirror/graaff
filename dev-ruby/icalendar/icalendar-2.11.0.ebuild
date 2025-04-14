# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="icalendar.gemspec"

inherit ruby-fakegem

DESCRIPTION="This library provides iCalendar support for ruby. (RFC-2445)"
HOMEPAGE="https://github.com/icalendar/icalendar"
SRC_URI="https://github.com/icalendar/icalendar/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="|| ( GPL-3 BSD )"

SLOT="2"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/base64
	>=dev-ruby/ice_cube-0.16:0
	dev-ruby/logger
	dev-ruby/ostruct
"

ruby_add_bdepend "test? ( dev-ruby/activesupport:7.1 dev-ruby/timecop >=dev-ruby/tzinfo-1.2:1 )"

all_ruby_prepare() {
	sed -i '/bundler/Id' Rakefile || die

	sed -e '/simplecov/,/end/ s:^:#:' \
		-e '1igem "activesupport", "~> 7.1"' \
		-i spec/spec_helper.rb || die

	sed -e 's/git ls-files --/echo/' \
		-e 's/git ls-files/find * -print/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
