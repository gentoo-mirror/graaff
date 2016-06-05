# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

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

RDEPEND=">=dev-python/django-1.6.11.1[${PYTHON_USEDEP}]
	<dev-python/django-1.7[${PYTHON_USEDEP}]
	dev-python/pillowfight[${PYTHON_USEDEP}]
	>=dev-python/django-pipeline-1.3.23[${PYTHON_USEDEP}]
	<dev-python/django-pipeline-1.4[${PYTHON_USEDEP}]
	>=dev-python/feedparser-5.1.2[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	# Running uglify is a problem right now, so skip this step. Rather
	# have newer versions than compacted javascript.
	sed -e "s/'pipeline.compressors.uglifyjs.UglifyJSCompressor'/None/" -i djblets/settings.py || die
}
