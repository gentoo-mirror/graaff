# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_GEMSPEC="rgen.gemspec"

COMMIT=bce986eff0d099afef7f42a19e33981cf5c54c11

inherit ruby-fakegem

DESCRIPTION="A framework for Model Driven Software Development (MDSD)"
HOMEPAGE="https://github.com/mthiede/rgen"
SRC_URI="https://github.com/mthiede/rgen/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
RUBY_S="rgen-${COMMIT}"

LICENSE="MIT"
KEYWORDS="~amd64"
SLOT="0"
