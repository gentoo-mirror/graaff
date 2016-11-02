# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_GEMSPEC="open_id_authentication.gemspec"

inherit ruby-fakegem

DESCRIPTION="a thin wrapper around the excellent ruby-openid gem from JanRain."
HOMEPAGE="https://github.com/grosser/open_id_authentication"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RUBY_PATCHES=( ${P}-dalli.patch )

ruby_add_rdepend ">=dev-ruby/rack-openid-1.3"
