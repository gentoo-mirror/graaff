# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

COMMIT=dd0894061f58479884e6cfa2d00382542dc77d5a

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="global_phone.gemspec"

inherit ruby-fakegem

DESCRIPTION="Parses, validates, and formats local and international phone numbers"
HOMEPAGE="https://github.com/sstephenson/global_phone"
SRC_URI="https://github.com/sstephenson/global_phone/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	# Remove globale_phone_dbgen parts
	rm -f lib/global_phone/database_generator.rb || die

	sed -i -e 's/__FILE__/"global_phone.gemspec"/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
