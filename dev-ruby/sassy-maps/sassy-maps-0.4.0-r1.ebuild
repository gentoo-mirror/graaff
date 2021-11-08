# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="sass"

inherit ruby-fakegem

DESCRIPTION="Map helper functions for Sass 3.3 Maps including get-deep and set/set-deep"
HOMEPAGE="https://github.com/Snugug/Sassy-Maps"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3:* =dev-ruby/sass-3*:*"
