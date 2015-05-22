# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC="build_rdoc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="gli.rdoc"

inherit ruby-fakegem

DESCRIPTION="Git-Like Interface Command Line Parser"
HOMEPAGE="http://davetron5000.github.com/gli"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "dev-util/cucumber"

all_ruby_prepare() {
	sed -e '/sdoc/ s:^:#:' -i Rakefile || die

	sed -e 's:tmp/fakehome:#{ENV["TMPDIR"]}/fakehome:' -i features/support/env.rb || die
}

each_ruby_test() {
	# Unit tests depend on unpackaged clean_test.
	${RUBY} -S cucumber --format progress features || die
}
