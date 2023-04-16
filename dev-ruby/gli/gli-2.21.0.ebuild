# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_TASK_DOC="build_rdoc"
RUBY_FAKEGEM_TASK_TEST='RUBYOPT="" test:unit test:integration'
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_BINWRAP="gli"
RUBY_FAKEGEM_EXTRAINSTALL="gli.rdoc"

inherit ruby-fakegem

DESCRIPTION="Git-Like Interface Command Line Parser"
HOMEPAGE="https://davetron5000.github.com/gli"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	sed -e '/sdoc/ s:^:#:' \
		-e '/bundler/I s:^:#:' \
		-i Rakefile || die
}
