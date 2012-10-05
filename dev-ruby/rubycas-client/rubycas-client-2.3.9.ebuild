# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.txt History.txt README.rdoc"

#RUBY_FAKEGEM_DOCDIR="doc"
#RUBY_FAKEGEM_TASK_DOC=""

# Tests require at least 'riot' which we have not packaged yet.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="rails_generators"

inherit ruby-fakegem

DESCRIPTION="Ruby client library for Yale's Central Authentication Service (CAS) protocol."
HOMEPAGE="http://github.com/rubycas/rubycas-client"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport"

all_ruby_prepare() {
	rm Gemfile Gemfile.lock || die
	sed -i -e "/require 'bundler'/,/end/ s:^:#:" Rakefile || die
}

all_ruby_install() {
	dodoc -r examples
}
