# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Analyzes code for structural similarities"
HOMEPAGE="https://ruby.sadi.st/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/erubi-1.10:0
	dev-ruby/path_expander:1
	dev-ruby/ruby_parser:3
	dev-ruby/sexp_processor:4
"

ruby_add_bdepend "test? (
	dev-ruby/hoe
	dev-ruby/isolate
	>=dev-ruby/minitest-5.8.0
	>=dev-ruby/ruby2ruby-2.2.0
)"

all_ruby_prepare() {
	# Loosen test dependencies
	sed -e '/minitest/ s/5.8.0/5.8/' \
		-e '/ruby2ruby/ s/2.2.0/2.2/' \
		-i Rakefile || die
}
