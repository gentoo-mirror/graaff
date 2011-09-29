# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/oauth/oauth-0.4.3.ebuild,v 1.1 2010/09/18 09:58:03 graaff Exp $

EAPI=4
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_TEST="none"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc UPGRADE.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="generators init.rb rails tasks"

RUBY_FAKEGEM_GEMSPEC="oauth-plugin.gemspec"

inherit ruby-fakegem

DESCRIPTION="A plugin for implementing OAuth Providers and Consumers in Rails applications."
HOMEPAGE="http://github.com/pelle/oauth-plugin"
SRC_URI="https://github.com/pelle/oauth-plugin/tarball/v0.4.0.pre7 -> ${P}.tgz"
RUBY_S="pelle-oauth-plugin-*"

LICENSE="MIT"
SLOT="0.4"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oauth-0.4.4"
ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

each_ruby_test() {
	${RUBY} -S rspec spec || die
}
