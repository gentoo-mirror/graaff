# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="config libexec template-dir"

RUBY_FAKEGEM_GEMSPEC="overcommit.gemspec"

inherit ruby-fakegem

DESCRIPTION="The Opinionated Git Hook Manager"
HOMEPAGE="https://github.com/sds/overcommit"
SRC_URI="https://github.com/sds/overcommit/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/childprocess:2
	>=dev-ruby/iniparse-1.4:1
	>=dev-ruby/rexml-3.2:3
"

all_ruby_prepare() {
	sed -i -e "s/_relative //" ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_install() {
	each_fakegem_install

	local hdir
	hdir="$(ruby_fakegem_gemsdir)/gems/${RUBY_FAKEGEM_NAME}-${RUBY_FAKEGEM_VERSION}/template-dir/hooks"

	fperms 0755 "${hdir}"/{commit-msg,overcommit-hook,post-checkout,post-commit,post-merge,post-rewrite,pre-commit,prepare-commit-msg,pre-push,pre-rebase}
}
