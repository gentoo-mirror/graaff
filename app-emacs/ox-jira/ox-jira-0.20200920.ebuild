# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

COMMIT=64d364cf08109e6877b74c0aa2c4ef690fe9501b

IUSE=""

DESCRIPTION="JIRA Backend for Org Export Engine"
HOMEPAGE="https://github.com/stig/ox-jira.el"
SRC_URI="https://github.com/stig/ox-jira.el/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ox-jira.el-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DOCS="README.org ox-jira.org"

DEPEND=">=app-emacs/org-mode-8.3"
RDEPEND=${DEPEND}
