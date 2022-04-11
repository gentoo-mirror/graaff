# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27 ruby30 ruby31"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTENSIONS=(ext/html_tokenizer_ext/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="HTML Tokenizer"
HOMEPAGE="https://rubygems.org/gems/html_tokenizer"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

each_ruby_test() {
	${RUBY} -Ilib:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
