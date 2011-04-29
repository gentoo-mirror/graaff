# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRAINSTALL="rails_best_practices.yml"

inherit ruby-fakegem

DESCRIPTION="a gem to check quality of rails app files"
HOMEPAGE="http://wiki.github.com/flyerhzm/rails_best_practices"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die
}

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

ruby_add_rdepend "dev-ruby/ruby_parser
	dev-ruby/colored
	dev-ruby/erubis
	dev-ruby/haml
	dev-ruby/activesupport
	dev-ruby/i18n
	dev-ruby/ruby-progressbar"
