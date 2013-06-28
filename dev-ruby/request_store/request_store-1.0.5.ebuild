# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="RequestStore gives you per-request global storage"
HOMEPAGE="https://github.com/steveklabnik/request_store"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-3.0 )"
