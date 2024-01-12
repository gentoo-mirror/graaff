# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="nokogiri-happymapper.gemspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Parse XML data and convert it quickly and easily into ruby data structures"
HOMEPAGE="https://rubygems.org/gems/nokogiri-happymapper"
SRC_URI="https://github.com/mvz/happymapper/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="happymapper-${PV}"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#:' -e '/pry/ s:^:#:' spec/spec_helper.rb || die
	sed -i -e 's:_relative ": "./:' ${RUBY_FAKEGEM_GEMSPEC} || die
}
