# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"

RUBY_FAKEGEM_TASK_TEST="-Ilib test features"

RUBY_FAKEGEM_EXTRAINSTALL="frameworks VERSION.yml"

inherit ruby-fakegem

DESCRIPTION="Compass Stylesheet Authoring Framework"
HOMEPAGE="http://compass-style.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Fails tests with sass 3.2, already fixed upstream. The features also
# require css_parser to be installed.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/chunky_png-1.2
	>=dev-ruby/fssm-0.2.7
	>=dev-ruby/sass-3.1"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/ s:^:#:' Rakefile || die
}
