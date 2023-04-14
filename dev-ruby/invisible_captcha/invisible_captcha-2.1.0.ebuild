# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Unobtrusive, flexible and simple spam protection for Rails applications"
HOMEPAGE="https://github.com/markets/invisible_captcha"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

# All tests are integration tests that require a dummy application that
# gets gemfiles via appraisal.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/rails-5.2:*"
