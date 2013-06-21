# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.md"

RUBY_FAKEGEM_TASK_TEST="spec features"

#RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="A tool that examines Ruby classes, modules and methods and reports any code smells it finds."
HOMEPAGE="http://wiki.github.com/kevinrutherford/reek/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

ruby_add_rdepend "dev-ruby/ruby_parser:3
	dev-ruby/ruby2ruby:2
	dev-ruby/sexp_processor"

all_ruby_prepare() {
	sed -i -e '/bundler/I s:^:#:' spec/spec_helper.rb || die
}
