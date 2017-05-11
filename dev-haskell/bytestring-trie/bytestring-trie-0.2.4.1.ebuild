# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="An efficient finite map from (byte)strings to values"
HOMEPAGE="http://hackage.haskell.org/package/bytestring-trie"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.4.1:=
	dev-haskell/binary
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"
