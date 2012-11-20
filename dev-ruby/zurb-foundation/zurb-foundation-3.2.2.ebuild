# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md index.html README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="scss templates vendor"

inherit ruby-fakegem

DESCRIPTION="Foundation is the most advanced responsive front-end framework in the world"
HOMEPAGE="http://foundation.zurb.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/compass-0.12.2
	>=dev-ruby/modular-scale-1.0.2
	dev-ruby/rake
	>=dev-ruby/sass-3.2.0"
