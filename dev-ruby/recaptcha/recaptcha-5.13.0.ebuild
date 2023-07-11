# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="recaptcha.gemspec"

inherit ruby-fakegem

DESCRIPTION="Adds helpers for the reCAPTCHA API"
HOMEPAGE="https://github.com/ambethia/recaptcha"
SRC_URI="https://github.com/ambethia/recaptcha/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="5"
IUSE="test"

ruby_add_rdepend "dev-ruby/json:*"

ruby_add_bdepend "test? (
	dev-ruby/bundler
	dev-ruby/maxitest
	dev-ruby/mocha:1.0
	dev-ruby/i18n
	dev-ruby/minitest:5
	dev-ruby/webmock
)"

all_ruby_prepare() {
	sed -i -e '/\(bump\|byebug\)/ s:^:#:' Rakefile test/helper.rb || die
	sed -i -e '/\(bump\|pry\)/ s:^:#:' ${RUBY_FAKEGEM_GEMSPEC} || die
	rm -f Gemfile.lock || die

	sed -i -e '/mocha/ s/$/, "~> 1.0"/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
