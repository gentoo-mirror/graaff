# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A more flexible and feature-rich alternative to traditional Ruby accessors"
HOMEPAGE="https://rubygems.org/gems/smart_properties"
LICENSE="MIT"

SLOT="1"
KEYWORDS="~amd64"

all_ruby_prepare() {
	sed -i -e '/\(bundler\|pry\)/ s:^:#:' spec/spec_helper.rb || die

	# Account for changed output in Ruby 3.4
	sed -e '/message/ s/`/./' \
		-i spec/base_spec.rb || die
}
