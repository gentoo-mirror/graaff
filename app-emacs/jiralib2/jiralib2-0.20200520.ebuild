# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

COMMIT=c21c4e759eff549dbda11099f2f680b78d7f5a01

IUSE=""

DESCRIPTION="JIRA REST API bindings to elisp"
HOMEPAGE="https://github.com/nyyManni/jiralib2"
SRC_URI="https://github.com/nyyManni/jiralib2/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/jiralib2-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DOCS="README.org"

DEPEND=">=app-emacs/request-0.3 >=app-emacs/dash-2.14.1"
RDEPEND=${DEPEND}
