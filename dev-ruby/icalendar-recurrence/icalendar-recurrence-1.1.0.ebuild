# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides recurrence to icalendar gem"
HOMEPAGE="https://github.com/icalendar/icalendar-recurrence"
LICENSE="|| ( GPL-2 BSD Ruby )"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

ruby_add_rdepend "dev-ruby/icalendar:2 >=dev-ruby/ice_cube-0.13.0"

all_ruby_prepare() {
	sed -i -e 's/0.13.0/0.13/' ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -i -e '/\(awesome\|pry\)/ s:^:#:' spec/spec_helper.rb || die
}
