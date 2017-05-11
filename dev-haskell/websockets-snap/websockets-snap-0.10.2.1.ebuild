# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Snap integration for the websockets library"
HOMEPAGE="http://hackage.haskell.org/package/websockets-snap"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"  # no test suite

RDEPEND=">=dev-lang/ghc-7.4.1:=
	>=dev-haskell/bytestring-builder-0.9 <dev-haskell/bytestring-builder-0.11
	=dev-haskell/io-streams-1.3*
	>=dev-haskell/mtl-2.1 <dev-haskell/mtl-2.3
	=dev-haskell/snap-core-1.0*
	=dev-haskell/snap-server-1.0*
	>=dev-haskell/websockets-0.9.5 <dev-haskell/websockets-0.12
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"
