# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Allows you to parse XML data and convert it quickly and easily into ruby data structures"
HOMEPAGE="https://rubygems.org/gems/nokogiri-happymapper"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

# Missing dependencies.
RESTRICT="test"
