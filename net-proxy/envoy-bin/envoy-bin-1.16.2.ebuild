# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Use the getenvoy binaries for now: https://tetrate.bintray.com/getenvoy/manifest.json
BUILD_ID=p0.ge98e41a-1p70.g486d4e2

DESCRIPTION="An open source edge and service proxy"
HOMEPAGE="https://www.envoyproxy.io/"
SRC_URI="https://dl.bintray.com/tetrate/getenvoy/getenvoy-envoy-${PV}.${BUILD_ID}-linux-glibc-release-x86_64.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/getenvoy-envoy-${PV}.${BUILD_ID}-linux-glibc-release-x86_64"

src_install() {
	dobin bin/envoy
}
