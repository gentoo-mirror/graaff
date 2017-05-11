# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A bundle of all Elm tools, usable through the elm executable"
HOMEPAGE="http://elm-lang.org"
SRC_URI="https://github.com/elm-lang/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RESTRICT=test # requires additional packages

RDEPEND="
	>=dev-lang/ghc-7.6.0:=
	>=dev-haskell/aeson-0.11
	<dev-haskell/aeson-pretty-0.8
	>=dev-haskell/ansi-terminal-0.6.2.1 <dev-haskell/ansi-terminal-0.7
	>=dev-haskell/ansi-wl-pprint-0.6.7 <dev-haskell/ansi-wl-pprint-0.7
	>=dev-haskell/binary-0.7.0.0 <dev-haskell/binary-0.8
	>=dev-haskell/edit-distance-0.2 <dev-haskell/edit-distance-0.3
	>=dev-haskell/language-glsl-0.0.2 <dev-haskell/language-glsl-0.3
	>=dev-haskell/mtl-2.2 <dev-haskell/mtl-3
	dev-haskell/parsec
	>=dev-haskell/text-1 <dev-haskell/text-2
	>=dev-haskell/union-find-0.2 <dev-haskell/union-find-0.3
"

DEPEND="${RDEPEND}
	dev-haskell/cabal
"

#src_prepare() {
#	cabal_chdeps \
#		'aeson >= 0.7 && < 0.9' 'aeson >= 0.7' \
#		'blaze-html >= 0.5 && < 0.8' 'blaze-html >= 0.5' \
#		'blaze-markup >= 0.5.1 && < 0.7' 'blaze-markup >= 0.5.1' \
#		'language-glsl >= 0.0.2 && < 0.2' 'language-glsl >= 0.0.2'
#}
