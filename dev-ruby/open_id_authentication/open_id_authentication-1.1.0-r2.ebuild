# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

RUBY_FAKEGEM_GEMSPEC="open_id_authentication.gemspec"

inherit ruby-fakegem

DESCRIPTION="a thin wrapper around the excellent ruby-openid gem from JanRain."
HOMEPAGE="http://github.com/Velir/open_id_authentication"
LICENSE="MIT"
SRC_URI="https://github.com/Velir/open_id_authentication/tarball/4f0ebc18b3 -> ${P}.tgz"

RUBY_S="Velir-open_id_authentication-*"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-openid-1.3"
