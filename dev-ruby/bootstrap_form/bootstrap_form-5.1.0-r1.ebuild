# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="A rails form builder to create forms using Bootstrap 4"
HOMEPAGE="https://github.com/bootstrap-ruby/bootstrap_form"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

# tests not included in gem, will also require custom setup to test
# various gemfiles.
RESTRICT="test"

PATCHES=( "${FILESDIR}/${P}-required.patch" )

ruby_add_rdepend ">=dev-ruby/rails-5.2:*"
