# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Reusable, generic mixins for Django"
HOMEPAGE="https://github.com/brack3t/django-braces"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	>=dev-python/django-1.4[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"
