# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A few useful extensions to core Ruby classes"
HOMEPAGE="https://github.com/bbatsov/powerpack"

LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
