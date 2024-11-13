# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A templating language that converts simple HTML into responsive email-ready HTML"
HOMEPAGE="https://github.com/foundation/inky-rb"
LICENSE="MIT"

SLOT="1"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/foundation_emails:2
	dev-ruby/nokogiri
"

ruby_add_bdepend "test? (
	dev-ruby/bundler
	dev-ruby/capybara
	dev-ruby/rails
	dev-ruby/rspec-rails
)"

all_ruby_prepare() {
	rm -f Gemfile.lock || die
	sed -i -e '/rubocop/I s:^:#:' -e '/bundler/I s:^:#:' Rakefile || die
	sed -i -e '/rubocop/ s:^:#:' inky.gemspec || die

	# Avoid tests depending on old versions of slim
	sed -e '/when configured to use a different template engine/ s/context/xcontext/' \
		-e '/(like slim)/ s/it/xit/' \
		-i spec/test_app/spec/features/inky_spec.rb || die
}
