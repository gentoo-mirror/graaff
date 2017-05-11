# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Efficient union and equivalence testing of sets"
HOMEPAGE="http://hackage.haskell.org/package/union-find"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"  # no test suite

RDEPEND=">=dev-lang/ghc-7.4.1:=
	>=dev-haskell/attoparsec-0.10 <dev-haskell/attoparsec-0.14
	>=dev-haskell/base64-bytestring-0.1 <dev-haskell/base64-bytestring-1.1
	>=dev-haskell/binary-0.5 <dev-haskell/binary-0.9
	>=dev-haskell/blaze-builder-0.3 <dev-haskell/blaze-builder-0.5
	>=dev-haskell/case-insensitive-0.3 <dev-haskell/case-insensitive-1.3
	>=dev-haskell/entropy-0.2.1 <dev-haskell/entropy-0.4
	>=dev-haskell/network-2.3 <dev-haskell/network-2.7
	>=dev-haskell/random-1.0 <dev-haskell/random-1.2
	>=dev-haskell/sha-1.5 <dev-haskell/sha-1.7
	>=dev-haskell/text-0.10 <dev-haskell/text-1.3
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"
