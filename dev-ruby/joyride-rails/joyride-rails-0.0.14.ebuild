# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"

# Uses haml-rails which is not packaged.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="app config"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Super sassy and super easy CSS3 buttons"
HOMEPAGE="http://jaredhardy.com/sassy-buttons/"
SRC_URI="https://github.com/TrueNorth/joyride-rails/archive/v${PV}.tar.gz -> ${P}-git.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/compass-0.12.2
	>=dev-ruby/sass-3.2.0"

all_ruby_prepare() {
	# Remove haml dependency since it is not a runtime dependency and I
	# don't use it.
	sed -i '/haml/d' ${RUBY_FAKEGEM_GEMSPEC} || die
}
