# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"

RUBY_FAKEGEM_TASK_TEST="-Ilib test features"

RUBY_FAKEGEM_EXTRAINSTALL="frameworks VERSION.yml"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Compass Stylesheet Authoring Framework"
HOMEPAGE="http://compass-style.org/"
SRC_URI="https://github.com/chriseppstein/compass/archive/v${PV}.tar.gz -> ${P}-git.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Fails tests with sass 3.2, already fixed upstream. The features also
# require css_parser to be installed.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/chunky_png-1.2
	>=dev-ruby/sass-3.1"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/ s:^:#:' Rakefile || die

	sed -i -e '/Date.today/d' -e '/fssm/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}
