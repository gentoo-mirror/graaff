# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Works for both HOTP and TOTP, and includes QR Code provisioning"
HOMEPAGE="https://github.com/mdp/rotp"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "
	test? ( dev-ruby/timecop )
"

all_ruby_prepare() {
	# Remove pregenerated documentation so we can update it.
	rm -rf doc || die

	sed -e '/simplecov/,/^end/ s:^:#:' \
		-e '1irequire "uri"' \
		-i spec/spec_helper.rb || die
}