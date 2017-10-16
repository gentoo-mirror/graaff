# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_RECIPE_TEST="none"

RUBY_FAKEGEM_EXTRAINSTALL="app vendor"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Integration of TinyMCE with the Rails asset pipeline"
HOMEPAGE="https://github.com/spohlenz/tinymce-rails"
SRC_URI="https://rubygems.org/gems/tinymce-rails-4.5.7.gem http://download.ephox.com/tinymce/community/tinymce_4.5.8.zip http://download.ephox.com/tinymce/community/tinymce_4.5.8_dev.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1.1:*"

all_ruby_prepare() {
	mkdir tmp || die
	cp "${DISTDIR}/tinymce_${PV}.zip" tmp/tinymce.zip || die
	cp "${DISTDIR}/tinymce_${PV}_dev.zip" tmp/tinymce.dev.zip || die

	rake extract rename || die
}
