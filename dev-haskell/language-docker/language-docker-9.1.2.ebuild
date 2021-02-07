# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_P="language-docker-${PV}"

DESCRIPTION="Dockerfile parser, pretty-printer and embedded DSL"
HOMEPAGE="https://github.com/hadolint/language-docker"
SRC_URI="https://hackage.haskell.org/package/language-docker/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-haskell/data-default-class:=[profile?]
	>=dev-haskell/megaparsec-8.0.0:=[profile?]
	dev-haskell/prettyprinter:=[profile?]
	>=dev-haskell/split-0.2:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-lang/ghc-8.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.0.0
"

S="${WORKDIR}/${MY_P}"
