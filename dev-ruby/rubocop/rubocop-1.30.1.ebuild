# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="assets config"
RUBY_FAKEGEM_BINDIR="exe"

RUBY_FAKEGEM_GEMSPEC="rubocop.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Ruby static code analyzer"
HOMEPAGE="https://github.com/bbatsov/rubocop"
SRC_URI="https://github.com/bbatsov/rubocop/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/parallel-1.10:1
	>=dev-ruby/parser-3.1.0.0
	dev-ruby/rainbow:3
	dev-ruby/regexp_parser:2
	>=dev-ruby/rexml-3.2.5:3
	>=dev-ruby/rubocop-ast-1.18.0:1
	>=dev-ruby/ruby-progressbar-1.7:0
	|| ( dev-ruby/unicode-display_width:2 >=dev-ruby/unicode-display_width-1.4.0:1 )"

ruby_add_bdepend "test? ( dev-ruby/bundler dev-ruby/webmock )"

all_ruby_prepare() {
	sed -e '/pry/ s:^:#:' \
		-i spec/spec_helper.rb || die
	sed -i -e "s:_relative ': './:" ${RUBY_FAKEGEM_GEMSPEC} || die

	# Avoid bundler spec
	sed -i -e '/and the gem is bundled/,/^      end/ s:^:#:' spec/rubocop/config_loader_spec.rb || die
	sed -i -e '/bundler integration/,/^    end/ s:^:#:' spec/rubocop/cli_spec.rb || die
	rm -f spec/rubocop/cli_spec.rb spec/rubocop/lockfile_spec.rb || die

	# Avoid specs requiring rubocop-rake
	sed -i -e '/compliance with rubocop/,/^  end/ s:^:#:' spec/rubocop/cop/generator_spec.rb || die

	sed -e 's:/tmp/example:'${TMPDIR}'/example:' \
		-e 's:/tmp/Gemfile:'${TMPDIR}'/Gemfile:' \
		-i spec/rubocop/cop/team_spec.rb || die
}
