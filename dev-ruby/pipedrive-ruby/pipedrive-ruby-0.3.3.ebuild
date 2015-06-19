# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for the LinkedIn API"
HOMEPAGE="http://github.com/hexgnu/linkedin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	dev-ruby/httparty
	>=dev-ruby/json-1.7.7
	>=dev-ruby/multi_xml-0.5.2
"

ruby_add_bdepend "test? (
	dev-ruby/test-unit:2 dev-ruby/shoulda
)"

all_ruby_prepare() {
	# Remove test dependencies that should not be runtime dependencies
	# https://github.com/GeneralScripting/pipedrive-ruby/issues/19
	sed -e '/\(coveralls\|webmock\)/ s:^:#:' -i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -e '/coverall/I s:^:#:' \
		-e '/^begin/,/^end/ s:^:#:' -i test/helper.rb || die
}

each_ruby_test() {
	${RUBY} -S testrb-2 test/test_*.rb || die
}
