# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Code analyzer helps you build your own code analyzer tool."
HOMEPAGE="https://github.com/flyerhzm/code_analyzer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0.5"
IUSE="doc"

ruby_add_rdepend "dev-ruby/sexp_processor"

all_ruby_prepare() {
	sed -i -e '/should get value for assoc_new/askip "fixed in next release"' spec/code_analyzer/sexp_spec.rb || die
}
