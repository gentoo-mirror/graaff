# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/Djblets/Djblets-0.7.30.ebuild,v 1.1 2014/07/30 14:31:27 xmw Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="A collection of useful extensions for Django"
HOMEPAGE="http://github.com/djblets/djblets"
SRC_URI="http://downloads.reviewboard.org/releases/${PN}/$(get_version_component_range 1-2)/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/django-1.4.13[${PYTHON_USEDEP}]
	<dev-python/django-1.5[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/django-pipeline-1.2.24[${PYTHON_USEDEP}]
	<dev-python/django-pipeline-1.3[${PYTHON_USEDEP}]
	>=dev-python/feedparser-5.1.2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/django-evolution[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

prepare_src() {
	# use pillow, not PIL
	sed -e 's/PIL/pillow/' -i setup.py Djblets.egg-info/requires.txt || die
}
