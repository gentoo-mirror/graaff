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

RDEPEND=">=dev-lang/ghc-7.4.1:=
	>=dev-haskell/transformers-0.2
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"
