# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

GIT_COMMIT=8e1464113b489b54067294cd988ff6a11a423fdb

IUSE="test"
RESTRICT="!test? ( test )"

DESCRIPTION="A major mode for editing Cucumber stories."
HOMEPAGE="https://github.com/michaelklishin/cucumber.el"
SRC_URI="https://github.com/michaelklishin/cucumber.el/archive/${GIT_COMMIT}.tar.gz -> ${P}-git.tgz"
LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

S="${WORKDIR}/cucumber.el-${GIT_COMMIT}"

RDEPEND="
	dev-ruby/ruby_parser
	>=dev-util/cucumber-4.1.0
	>=dev-util/cucumber-gherkin-14.0.1
"

DEPEND="test? ( dev-ruby/bundler )"

src_prepare() {
	rm -f Gemfile.lock || die

	default
}

src_install() {
	elisp_src_install

	elisp-install ${PN}/support support/find_step.rb

	dodoc README.md
}
