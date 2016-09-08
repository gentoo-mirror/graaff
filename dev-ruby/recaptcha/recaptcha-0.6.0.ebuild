# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.md"

inherit ruby-fakegem

DESCRIPTION="Adds helpers for the reCAPTCHA API"
HOMEPAGE="https://github.com/ambethia/recaptcha"
SRC_URI="https://github.com/ambethia/recaptcha/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0.6"
IUSE="test"

ruby_add_rdepend "dev-ruby/json:*"

ruby_add_bdepend "test? (
	dev-ruby/mocha
	dev-ruby/activesupport
	dev-ruby/i18n
	dev-ruby/minitest:5
)"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' \
		-e '/bump/ s:^:#:' Rakefile test/helper.rb || die
}
