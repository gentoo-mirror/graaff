inherit java-pkg-2

DESCRIPTION="Gerrit Code Review"
HOMEPAGE="https://code.google.com/p/gerrit/"
LICENSE="MIT"
SRC_URI="https://gerrit-releases.storage.googleapis.com/gerrit-${PV}.war"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-fonts/dejavu"
RDEPEND="${DEPEND}
		>=virtual/jdk-1.6"

pkg_setup() {
	enewgroup gerrit
	enewuser gerrit -1 /bin/bash /var/lib/gerrit gerrit
}

src_unpack() {
	mkdir "${S}" || die
	cp ${DISTDIR}/${A} "${S}"/ || die
}

src_install() {
	insinto /usr/lib/gerrit
	newins gerrit-${PV}.war gerrit.war

#	newinitd "${FILESDIR}/init.sh" jenkins
#	newconfd "${FILESDIR}/conf" jenkins
}
