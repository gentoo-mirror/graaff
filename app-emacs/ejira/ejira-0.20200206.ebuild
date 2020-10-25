# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

COMMIT=89f7c668caf0e46e929f2c9187b007eed6b5c229

IUSE=""

DESCRIPTION="JIRA integration to Emacs org-mode"
HOMEPAGE="https://github.com/nyyManni/ejira"
SRC_URI="https://github.com/nyyManni/ejira/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ejira-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.org"

DEPEND="
	app-emacs/jiralib2
	app-emacs/language-detection
	>=app-emacs/org-mode-8.3
	app-emacs/ox-jira
	app-emacs/s
"
RDEPEND=${DEPEND}

src_prepare() {
	# Drop support for unpackaged helm for now
	rm -f helm-ejira.el || die

	default
}
