# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.txt README.txt"

#RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="This library dynamically replace net/smtp and net/pop with these in ruby 1.9, thus enabling SSL/TLS."
HOMEPAGE="http://rubyforge.org/projects/tlsmail/"
LICENSE="public-domain"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/hoe )"
#ruby_add_bdepend "test? ( dev-ruby/hoe virtual/ruby-test-unit )"

# Tests require a live mail service to test against.
RESTRICT="test"

all_ruby_prepare() {
	echo ${PV} > VERSION
}
