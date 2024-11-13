# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

COMMIT=c9055d56ba82b714746e679d4abb141606f4c174

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="pipedrive.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_NAME="pipedrive.rb"
RUBY_FAKEGEM_VERSION="0.3.0"

inherit ruby-fakegem

DESCRIPTION="Pipedrive.com API Wrapper"
HOMEPAGE="https://github.com/amoniacou/pipedrive.rb"
SRC_URI="https://github.com/amoniacou/pipedrive.rb/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="pipedrive.rb-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

PATCHES=(
	"${FILESDIR}/${PN}-0.3.0-array.patch"
	"${FILESDIR}/${PN}-faraday-2.patch"
)

ruby_add_rdepend "
	>=dev-ruby/activesupport-4.0.0:*
	dev-ruby/faraday:2
	dev-ruby/faraday-mashify
	>=dev-ruby/hashie-3.0:*
"

ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e '/simplecov/,/^end/ s:^:#:' spec/spec_helper.rb || die
	sed -i -e 's/v0.2.0/v0.3.0/' spec/lib/pipedrive/base_spec.rb || die

	sed -e '/with/ s/start: 0/{ start: 0 }/ ; /with/ s/start: 10/{ start: 10 }/' \
		-i spec/lib/pipedrive/operations/read_spec.rb || die

	sed -i -e 's/git ls-files -z/find * -print0/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
