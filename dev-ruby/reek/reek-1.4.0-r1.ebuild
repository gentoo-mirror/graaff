# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.md"

RUBY_FAKEGEM_TASK_TEST="spec features"

RUBY_FAKEGEM_EXTRAINSTALL="assets config"

inherit ruby-fakegem

DESCRIPTION="A tool that examines Ruby classes, modules and methods and reports any code smells it finds."
HOMEPAGE="http://wiki.github.com/kevinrutherford/reek/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby_parser-3.5:3
	>=dev-ruby/ruby2ruby-2.0.8:2
	>=dev-ruby/sexp_processor-4.4:4
	dev-ruby/rainbow:2"

all_ruby_prepare() {
	# Avoid spec failing due to missing files in gem.
	sed -e '/with a smelly Dir masked by a dotfile/,/^  end/ s:^:#:' \
		-i spec/reek/examiner_spec.rb || die
}
