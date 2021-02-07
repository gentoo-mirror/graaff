# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_P="hadolint-${PV}"

DESCRIPTION="Dockerfile linter"
HOMEPAGE="https://hadolint.github.io/hadolint/"
SRC_URI="https://hackage.haskell.org/package/hadolint/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-haskell/aeson:=[profile?]
	dev-haskell/async:=[profile?]
	dev-haskell/cryptonite:=[profile?]
	>=dev-haskell/gitrev-1.3.1:=[profile?]
	dev-haskell/hsyaml:=[profile?]
	>=dev-haskell/megaparsec-9.0.0:=[profile?]
	>=dev-haskell/mtl-2.2.1:=[profile?]
	>=dev-haskell/optparse-applicative-0.14.0:=[profile?]
	dev-haskell/parallel:=[profile?]
	>=dev-util/shellcheck-0.7.1:=[profile?]
	>=dev-haskell/split-0.2:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/void:=[profile?]
	>=dev-lang/ghc-8.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.0.0
"

S="${WORKDIR}/${MY_P}"
