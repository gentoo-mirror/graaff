# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/zentest/zentest-3.3.0.ebuild,v 1.1 2006/08/28 14:34:06 pclouds Exp $

EAPI="2"
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="rails_generators"

# There are also features for the example projects, but these make the
# fixjour and mimetype-fu optional dependencies mandatory. Skipping
# for now.
RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="A collection of RSpec matchers and Cucumber steps to make testing emails go smoothly."
HOMEPAGE="http://github.com/bmabey/email-spec"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec dev-util/cucumber )"

all_ruby_prepare() {
	# Don't auto-install other gems using gem install. Should be
	# patched out properly.
	sed -i -e '/gem install/d' Rakefile || die

	# Accept higher versions of Rails
	sed -i -e 's/2.3.5/~>2.3.5/' examples/rails_root/config/environment.rb || die
}
