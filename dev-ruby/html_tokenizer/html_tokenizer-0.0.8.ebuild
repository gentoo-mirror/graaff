# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTENSIONS=(ext/html_tokenizer_ext/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="HTML Tokenizer"
HOMEPAGE="https://rubygems.org/gems/html_tokenizer"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

each_ruby_test() {
	${RUBY} -Ilib:. -e "Dir['test/**/*_test.rb'].each{|f| require f}" || die
}
