# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A bundle of all Elm tools, usable through the elm executable"
HOMEPAGE="http://elm-lang.org"
SRC_URI="https://github.com/elm-lang/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RESTRICT=test # almost compiles

RDEPEND="
	>=dev-lang/ghc-7.6.0:=
	>=dev-haskell/aeson-0.11
	dev-haskell/aeson-pretty
	>=dev-haskell/ansi-wl-pprint-0.6.7.3
	>=dev-haskell/binary-0.7.0.0 <dev-haskell/binary-0.8
	dev-haskell/edit-distance
	~dev-lang/elm-compiler-${PV}
	>=dev-haskell/http-4000.2.5 <dev-haskell/http-4000.4
	>=dev-haskell/http-client-0.4.15 <dev-haskell/http-client-0.5
	>=dev-haskell/http-client-tls-0.2 <dev-haskell/http-client-tls-0.3
	>=dev-haskell/http-types-0.7 <dev-haskell/http-types-0.9
	>=dev-haskell/mtl-2.2.1 <dev-haskell/mtl-3
	>=dev-haskell/network-2.4 <dev-haskell/network-2.7
	dev-haskell/text
	dev-haskell/unordered-containers
	>=dev-haskell/vector-0.10 <dev-haskell/vector-0.12
	dev-haskell/zip-archive
"

# Maybe in default haskell install?
#	>=dev-haskell/base-4.2 <dev-haskell/base-5

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
