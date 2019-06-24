# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="app vendor"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Integration of TinyMCE with the Rails asset pipeline"
HOMEPAGE="https://github.com/spohlenz/tinymce-rails"
SRC_URI="https://rubygems.org/gems/tinymce-rails-5.0.5.gem https://download.ephox.com/tinymce/community/tinymce_${PV}.zip https://download.ephox.com/tinymce/community/tinymce_${PV}_dev.zip"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1.1:*"

all_ruby_prepare() {
	mkdir tmp || die
	cp "${DISTDIR}/tinymce_${PV}.zip" tmp/tinymce.zip || die
	cp "${DISTDIR}/tinymce_${PV}_dev.zip" tmp/tinymce.dev.zip || die

	rake extract rename || die

	# Substitute the correct version number
	sed -i -e 's/5.0.5/'${PV}'/' ../metadata lib/tinymce/rails/version.rb || die
}
