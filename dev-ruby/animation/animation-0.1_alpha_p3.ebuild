# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.mdown"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="stylesheets"

RUBY_FAKEGEM_VERSION=${PV/_alpha_p/.alpha.}

inherit ruby-fakegem

DESCRIPTION="Animation Compass Plugin"
HOMEPAGE="https://github.com/ericam/compass-animation"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/compass-0.12.0
	>=dev-ruby/sass-3.2.0"
