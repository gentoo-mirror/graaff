# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33"

# Requires capybara + poltergeist
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="assets"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Bootstrap 5 rubygem for Rails / Sprockets / Hanami / etc"
HOMEPAGE="https://github.com/twbs/bootstrap-rubygem"
LICENSE="MIT"

SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

# A sass engine is required, but we only package sassc-rails at the moment.
ruby_add_rdepend "
	>=dev-ruby/popper_js-2.11.8:2
	>=dev-ruby/sassc-rails-2.0.0
"

all_ruby_prepare() {
	sed -i -e '/reporters/I s:^:#:' test/test_helper.rb || die
}
