# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Allows you compile Elm files and write to a file or stdout"
HOMEPAGE="https://github.com/fbonetti/ruby-elm-compiler"
SRC_URI="https://github.com/fbonetti/ruby-elm-compiler/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="ruby-elm-compiler-${PV}"

LICENSE="MIT"
SLOT="0.3"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=" dev-lang/elm"
