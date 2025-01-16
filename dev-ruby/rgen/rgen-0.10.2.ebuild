# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_GEMSPEC="rgen.gemspec"

inherit ruby-fakegem

DESCRIPTION="A framework for Model Driven Software Development (MDSD)"
HOMEPAGE="https://github.com/mthiede/rgen"
SRC_URI="https://github.com/mthiede/rgen/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
