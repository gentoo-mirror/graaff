# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="rubocop-ast.gemspec"

inherit ruby-fakegem

DESCRIPTION="RuboCop's Node and NodePattern classes"
HOMEPAGE="https://github.com/rubocop/rubocop-ast"
SRC_URI="https://github.com/rubocop/rubocop-ast/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/parser-3.3.1.0
"

ruby_add_bdepend "dev-ruby/bundler >=dev-ruby/oedipus_lex-2.6.0 dev-ruby/racc dev-ruby/rspec:3"

all_ruby_prepare() {
	sed -e 's/git ls-files/find/' -i ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '3irequire "uri" ; gem "parser"' spec/spec_helper.rb || die
	sed -i -e '1irequire "oedipus_lex"' tasks/compile.rake || die

	# Avoid unneeded dependencies
	rm -f tasks/cut_release.rake || die
	sed -e "/\(gemspec\|bump\|pry\|'rubocop\|simplecov\)/ s:^:#:" \
		-e '/rake/ s/~> 13.0/>= 12/' \
		-e '/prism/ s:^:#:' \
		-i Gemfile || die

	rm -f tasks/check_commit.rake || die
}

each_ruby_prepare() {
	sed -i -e "s:bundle exec:${RUBY} -S:" tasks/compile.rake || die
}

each_ruby_compile() {
	${RUBY} -S rake generate || die
}
