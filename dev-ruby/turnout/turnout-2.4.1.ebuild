# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

# Slightly complicated setup in spec_helper, tbd later, uses rspec3
RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="turnout.gemspec"

inherit ruby-fakegem

DESCRIPTION="makes it easy to put your Rails application into maintenance mode"
HOMEPAGE="https://github.com/biola/turnout"
SRC_URI="https://github.com/biola/turnout/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="2"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/i18n-0.7:* =dev-ruby/i18n-0*:*
	|| ( dev-ruby/rack:2.0 dev-ruby/rack:1.6 dev-ruby/rack:1.5 dev-ruby/rack:1.4 )
	>=dev-ruby/rack-accept-0.4:0
	dev-ruby/tilt:2
"
