# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=3
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests."
HOMEPAGE="https://github.com/myronmarston/vcr/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="1"
IUSE="test"

# Tests don't work and possibly need a ton of dependencies.
RESTRICT="test"

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"
