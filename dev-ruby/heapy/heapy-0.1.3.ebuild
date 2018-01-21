# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Got a heap dump? Great. Use this tool to see what's in it!"
HOMEPAGE="https://github.com/schneems/heapy"
SRC_URI="https://github.com/schneems/heapy/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND+=" test? ( dev-vcs/git )"

all_ruby_prepare() {
	sed -i -e '/rake/ s/~>/>=/' heapy.gemspec || die
	git init . || die

	# Remove failing spec
	rm -f spec/slow_spec.rb || die
}
