# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A more flexible and feature-rich alternative to traditional Ruby accessors"
HOMEPAGE="https://rubygems.org/gems/smart_properties"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/\(bundler\|pry\)/ s:^:#:' spec/spec_helper.rb || die
}
