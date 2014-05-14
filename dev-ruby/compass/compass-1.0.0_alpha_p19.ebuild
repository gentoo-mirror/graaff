# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_TASK_TEST="-Ilib test features"

RUBY_FAKEGEM_EXTRAINSTALL="RELEASE_VERSION VERSION"

RUBY_FAKEGEM_VERSION=${PV/_alpha_p/.alpha.}

# Avoid installing the compass binary since the official version in the
# main tree will already do this for another slot. To be fixed when this
# version ends up in the main tree.
RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Compass Stylesheet Authoring Framework"
HOMEPAGE="http://compass-style.org/"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

# Gem does not contain all files needed to run specs and it is not clear
# which upstream repository/branch to use.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/chunky_png-1.2
	>=dev-ruby/compass-core-1.0.0_alpha_p17
	>=dev-ruby/compass-import-once-1.0.2:1.0
	dev-ruby/json
	>=dev-ruby/listen-1.1.0:1
	>=dev-ruby/sass-3.3.0:3.3"

ruby_add_bdepend "test? ( dev-ruby/colorize )"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/ s:^:#:' Rakefile || die

	# Loosen listen dependency since all 1.x versions are compatible.
	sed -i -e "s/1.1.0/'1.1'/" ../metadata || die
}
