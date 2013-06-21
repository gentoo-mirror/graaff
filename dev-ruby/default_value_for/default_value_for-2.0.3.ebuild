# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Allows one to define default values for ActiveRecord models in a declarative manner."
HOMEPAGE="https://github.com/FooBarWidget/default_value_for"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_test() {
	${RUBY} test.rb || die
}
