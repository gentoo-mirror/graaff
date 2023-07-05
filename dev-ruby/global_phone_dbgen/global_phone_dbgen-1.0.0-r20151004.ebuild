# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

COMMIT=dd0894061f58479884e6cfa2d00382542dc77d5a

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="global_phone_dbgen.gemspec"
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Parses, validates, and formats local and international phone numbers"
HOMEPAGE="https://github.com/sstephenson/global_phone"
SRC_URI="https://github.com/sstephenson/global_phone/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="global_phone-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"

all_ruby_prepare() {
	# Remove global_phone parts
	find lib -type f -print | grep -v database_generator.rb | xargs rm -f || die

	sed -e 's/__FILE__/"global_phone_dbgen.gemspec"/' \
		-e '/require/ s:^:#:' \
		-e 's/GlobalPhone::VERSION/"1.0.1"/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
