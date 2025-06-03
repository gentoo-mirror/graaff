# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides recurrence to icalendar gem"
HOMEPAGE="https://github.com/icalendar/icalendar-recurrence"
LICENSE="|| ( GPL-2 BSD Ruby )"

SLOT="1"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "dev-ruby/icalendar:2 >=dev-ruby/ice_cube-0.16 dev-ruby/tzinfo:2"

ruby_add_bdepend "test? ( <dev-ruby/activesupport-7.2 >=dev-ruby/timecop-0.9 )"

all_ruby_prepare() {
	sed -e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '/\(awesome\|pry\)/ s:^:#:' -e '1igem "activesupport", "<7.2"' spec/spec_helper.rb || die

	# Avoid output on STDOUT for warnings
	# https://github.com/icalendar/icalendar-recurrence/issues/13
	sed -i -e '58 s/warn/#warn/' lib/icalendar/recurrence/schedule.rb || die
}
