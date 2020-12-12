# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{7,8,9})
inherit distutils-r1

DESCRIPTION="SSH server auditing (banner, key exchange, encryption, mac, compression, etc)"
HOMEPAGE="https://github.com/jtesta/ssh-audit"
SRC_URI="https://github.com/jtesta/ssh-audit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests require prospector which is not packaged

src_install() {
	distutils-r1_src_install

	doman ssh-audit.1
}
