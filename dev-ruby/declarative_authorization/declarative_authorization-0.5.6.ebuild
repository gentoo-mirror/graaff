# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_DOCDIR="rdoc"

# Don't work due to Rails version problems.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="app authorization_rules.dist.rb init.rb"

inherit ruby-fakegem

DESCRIPTION="The declarative authorization plugin offers an authorization mechanism inspired by RBAC."
HOMEPAGE="https://github.com/stffn/declarative_authorization"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"
