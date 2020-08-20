# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GITHUB_COMMIT="0cdb6b488e07a8e6b4ffabc748ddd567c336d93d"

DESCRIPTION="A Munin plugin for monitoring Elasticsearch nodes"
HOMEPAGE="https://github.com/claygregory/munin-elasticsearch"
LICENSE="MIT"

SRC_URI="https://github.com/claygregory/munin-elasticsearch/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${GITHUB_COMMIT}"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ruby/json
	net-analyzer/munin
"

src_install() {
	default

	exeinto /usr/libexec/munin/plugins
	doexe elasticsearch_
}
