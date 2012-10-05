# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI=4
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Nested fragment caches with (even) less situps."
HOMEPAGE="https://github.com/rails"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_bdepend "test? ( dev-ruby/minitest )"
ruby_add_rdepend ">=dev-ruby/actionpack-3.2"

all_ruby_prepare() {
	rm Gemfile.lock || die
}
