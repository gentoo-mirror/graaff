# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="app vendor"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Integration of TinyMCE with the Rails asset pipeline"
HOMEPAGE="https://github.com/spohlenz/tinymce-rails"

LICENSE="GPL-2+"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/railties-3.1.1:*"

all_ruby_prepare() {
	# Remove CSS incompatible with libsass
	sed -e 's/max-height:min(650px,calc(100vh - 110px));/max-height:650px;/' \
		-i vendor/assets/javascripts/tinymce/skins/ui/*/skin*.css || die
}
