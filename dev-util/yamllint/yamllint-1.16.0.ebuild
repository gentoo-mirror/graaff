# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_5 python3_6)
inherit distutils-r1

DESCRIPTION="A linter for YAML files"
HOMEPAGE="https://github.com/adrienverge/yamllint"
SRC_URI="https://github.com/adrienverge/yamllint/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/pyyaml[${PYTHON_USEDEP}] dev-python/pathspec[${PYTHON_USEDEP}]"
