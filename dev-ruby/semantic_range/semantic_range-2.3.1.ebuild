# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="semantic_range.gemspec"

inherit ruby-fakegem

DESCRIPTION="node-semver in ruby for comparison and inclusion of semantic versions and ranges"
HOMEPAGE="https://libraries.io/github/librariesio/semantic_range"
SRC_URI="https://github.com/librariesio/semantic_range/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE=""
