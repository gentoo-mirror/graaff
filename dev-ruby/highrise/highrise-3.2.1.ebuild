# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A set of classes to access information on Highrise via the published API"
HOMEPAGE="https://github.com/tapajos/highrise/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/activeresource-3.2.13"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/Bundler/ s:^:#:' spec/spec_helper.rb || die
}
