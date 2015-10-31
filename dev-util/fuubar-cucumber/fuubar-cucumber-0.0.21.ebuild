# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.textile"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fuubar-cucumber is an instafailing cucumber formatter with progress bar."
HOMEPAGE="https://github.com/jeffkreeftmeijer/fuubar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-util/cucumber-1.3.0 =dev-util/cucumber-1.3*
	>=dev-ruby/ruby-progressbar-1.2.0 =dev-ruby/ruby-progressbar-1*"

all_ruby_prepare() {
	# Fix ruby-progressbar dependency.
	sed -i -e 's/1.2.0/1.2/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
