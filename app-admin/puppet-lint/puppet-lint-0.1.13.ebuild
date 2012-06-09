# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Checks recommended Puppet style guidelines."
HOMEPAGE="https://github.com/rodjek/puppet-lint/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "app-admin/puppet"
ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

each_ruby_test() {
	${RUBY} -S rspec spec || die
}
