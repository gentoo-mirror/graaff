# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="A collection of useful extensions for Django"
HOMEPAGE="https://github.com/djblets/djblets"
SRC_URI="https://downloads.reviewboard.org/releases/${PN}/$(get_version_component_range 1-2)/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-1.6.11.1[${PYTHON_USEDEP}]
	<dev-python/django-1.12[${PYTHON_USEDEP}]
	>=dev-python/django-pipeline-1.6.14[${PYTHON_USEDEP}]
	=dev-python/django-pipeline-1.6*[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/feedparser-5.1.2[${PYTHON_USEDEP}]
	dev-python/pillowfight[${PYTHON_USEDEP}]
	>=dev-python/publicsuffix-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-1.5[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	# Running uglify is a problem right now, so skip this step. Rather
	# have newer versions than compacted javascript.
	sed -e "s/'pipeline.compressors.uglifyjs.UglifyJSCompressor'/None/" -i djblets/settings.py || die

	default
}
