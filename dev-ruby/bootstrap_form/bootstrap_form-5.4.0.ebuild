# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="A rails form builder to create forms using Bootstrap 4"
HOMEPAGE="https://github.com/bootstrap-ruby/bootstrap_form"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

# tests not included in gem, will also require custom setup to test
# various gemfiles.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/rails-6.1:*"
