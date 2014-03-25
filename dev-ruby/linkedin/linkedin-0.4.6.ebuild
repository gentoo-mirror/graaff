# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="changelog.markdown README.markdown"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for the LinkedIn API"
HOMEPAGE="http://github.com/hexgnu/linkedin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Specs use vcr which is no longer packaged.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/hashie-1.2
	dev-ruby/multi_json:0
	>=dev-ruby/oauth-0.4
"
