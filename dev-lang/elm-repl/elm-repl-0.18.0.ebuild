# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A bundle of all Elm tools, usable through the elm executable"
HOMEPAGE="http://elm-lang.org"
SRC_URI="https://github.com/elm-lang/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

#RESTRICT="test" # has failures about unavailable modules

HDEPEND="
	>=dev-lang/ghc-7.6.0:=
	dev-haskell/binary
	>=dev-haskell/bytestring-trie-0.2.2 <dev-haskell/bytestring-trie-0.3
	>=dev-haskell/cmdargs-0.7 <dev-haskell/cmdargs-0.11
	~dev-lang/elm-compiler-${PV}
	dev-lang/elm-package
	>=dev-haskell/haskeline-0.7 <dev-haskell/haskeline-0.8
	>=dev-haskell/mtl-2.2.1 <dev-haskell/mtl-3
	>=dev-haskell/parsec-3.1.1 <dev-haskell/parsec-3.5
	dev-haskell/text
	net-libs/nodejs
"

DEPEND="${HDEPEND}
	dev-haskell/cabal
"

#src_prepare() {
#	cabal_chdeps \
#		'aeson >= 0.7 && < 0.9' 'aeson >= 0.7' \
#		'blaze-html >= 0.5 && < 0.8' 'blaze-html >= 0.5' \
#		'blaze-markup >= 0.5.1 && < 0.7' 'blaze-markup >= 0.5.1' \
#		'language-glsl >= 0.0.2 && < 0.2' 'language-glsl >= 0.0.2'
#}
