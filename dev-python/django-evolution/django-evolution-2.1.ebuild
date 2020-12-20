# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# This is now py3 compatible however is only re'd for Djblets which is py2.7 compat only
PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}
RELEASE="2.x"

DESCRIPTION="A database schema evolution tool for the Django web framework"
HOMEPAGE="https://code.google.com/p/django-evolution/ https://pypi.python.org/pypi/django_evolution/"
SRC_URI="https://downloads.reviewboard.org/releases/${PN}/${RELEASE}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_P}
DOCS=( NEWS )
