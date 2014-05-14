# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRAINSTALL="data stylesheets templates RELEASE_VERSION VERSION"

RUBY_FAKEGEM_VERSION=${PV/_alpha_p/.alpha.}

inherit ruby-fakegem

DESCRIPTION="Compass Stylesheet Authoring Framework"
HOMEPAGE="http://compass-style.org/"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/multi_json-1.0
	>=dev-ruby/sass-3.3.0 <dev-ruby/sass-3.4
"
