# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Indentation sensitive parser-combinators for parsec"
HOMEPAGE="http://hackage.haskell.org/package/indents"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.4.1:=
	>=dev-haskell/mtl-1 <dev-haskell/mtl-2.3
	>=dev-haskell/parsec-3 <dev-haskell/parsec-3.2
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

RESTRICT="test"
