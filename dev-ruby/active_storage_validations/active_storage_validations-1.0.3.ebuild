# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"

# No tests in gem and upstream not tagged
RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="Validations for Active Storage (presence)"
HOMEPAGE="https://github.com/igorkasyanchuk/active_storage_validations"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/rails-5.2.0
"
