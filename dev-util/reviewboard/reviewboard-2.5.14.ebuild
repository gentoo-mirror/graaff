# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1

MY_PN="ReviewBoard"
DESCRIPTION="A web-based code review tool that offers developers a way to handle code reviews"
HOMEPAGE="https://www.reviewboard.org/"
SRC_URI="https://downloads.reviewboard.org/releases/${MY_PN}/2.5/${MY_PN}-${PV}.tar.gz"
KEYWORDS="~amd64"
IUSE="codebase doc manual ldap rnotes test"

LICENSE="MIT"
SLOT="0"
S=${WORKDIR}/${MY_PN}-${PV}

RDEPEND=">=dev-python/django-1.6.11.1[${PYTHON_USEDEP},sqlite]
	<dev-python/django-1.7[${PYTHON_USEDEP},sqlite]
	>=dev-python/django-evolution-0.7.7[${PYTHON_USEDEP}]
	<dev-python/django-evolution-0.8[${PYTHON_USEDEP}]
	>=dev-python/django-haystack-2.3.1[${PYTHON_USEDEP}]
	<dev-python/django-haystack-2.5[${PYTHON_USEDEP}]
	dev-python/django-multiselectfield[${PYTHON_USEDEP}]
	>=dev-python/Djblets-0.9.9[${PYTHON_USEDEP}]
	<dev-python/Djblets-0.10[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.1[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	>=dev-python/markdown-2.6.0[${PYTHON_USEDEP}]
	<dev-python/markdown-2.7[${PYTHON_USEDEP}]
	>=dev-python/paramiko-1.12[${PYTHON_USEDEP}]
	>=dev-python/mimeparse-0.1.3[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-1.5[${PYTHON_USEDEP}]
	dev-python/python-memcached[${PYTHON_USEDEP}]
	>=dev-python/pytz-2015.2[${PYTHON_USEDEP}]
	dev-python/recaptcha-client[${PYTHON_USEDEP}]
	>=dev-python/whoosh-2.6[${PYTHON_USEDEP}]
	ldap? ( >=dev-python/python-ldap-2.4.21[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

REQUIRED_USE="doc? ( || ( codebase manual rnotes ) )"
# Tests mostly access the inet and when run mostly fail
RESTRICT=test

python_prepare_all() {
	# Running uglify is a problem right now, so skip this step. Rather
	# have newer versions than compacted javascript.
	sed -e "s/'pipeline.compressors.uglifyjs.UglifyJSCompressor'/None/" -i reviewboard/settings.py || die

	# Use newer markdown version still available
	sed -i -e '/markdown/ s/2.4/2.6/g' reviewboard/dependencies.py || die

	distutils-r1_python_prepare_all
}

python_compile_all() {
	# See https://code.google.com/p/reviewboard/issues/ #3009
	# until build of manual can find and use ROOT_URLCONF, only possible build path for manual
	# requires sacrificing the resources section, all of which call on ROOT_URLCONF
	local msg="Generating docs for"
	if use doc; then
		if use manual; then
			rm -rf docs/manual/webapi//2.0/resources/ || die
			einfo;einfo "$msg manual"
			DJANGO_SETTINGS_MODULE="django.conf" emake -C docs/manual html
		fi

		if use codebase; then
			pushd docs/codebase &> /dev/null
			ln -sf ../../contrib/internal/conf/settings_local.py .
			popd &> /dev/null
			einfo;einfo "$msg codebase"
			emake -C docs/codebase html
		fi

		if use rnotes; then
			einfo;einfo "$msg release notes"
			emake -C docs/releasenotes html
		fi
	fi
}

python_test() {
	pushd ${PN} > /dev/null
	ln -sf contrib/internal/conf/settings_local.py .
	"${PYTHON}" manage.py test || die
}

python_install_all() {
	if use doc; then
		if use manual; then
			insinto /usr/share/doc/${PF}/manual
			doins -r docs/manual/_build/html/
		fi
		if use codebase; then
			insinto /usr/share/doc/${PF}/codebase
			doins -r docs/codebase/_build/html/
		fi
		if use rnotes; then
			insinto /usr/share/doc/${PF}/release_notes
			doins -r docs/releasenotes/_build/html/
		fi
	fi
	distutils-r1_python_install_all
}

pkg_postinst() {
	elog "You must install any VCS tool you wish ${PN} to support."
	elog "dev-util/cvs, dev-vcs/git, dev-vcs/mercurial or dev-util/subversion."
	elog
	elog "Install dev-python/mysql-python for mysql support."
	elog "Install dev-python/psycopg for postgres support."
	elog
	elog "For speed and responsiveness, consider installing net-misc/memcached"
	elog "and dev-python/python-memcached"
}
