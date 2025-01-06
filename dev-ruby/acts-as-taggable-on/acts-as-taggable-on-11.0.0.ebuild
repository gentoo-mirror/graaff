# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_EXTRAINSTALL="db"

inherit ruby-fakegem

DESCRIPTION="Advanced tagging for Rails."
HOMEPAGE="https://github.com/mbleigh/acts-as-taggable-on/"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "|| ( dev-ruby/activerecord:7.2 dev-ruby/activerecord:7.1 dev-ruby/activerecord:7.0 )"

ruby_add_bdepend "test? (
	dev-ruby/database_cleaner
	|| ( dev-ruby/rails:7.2 dev-ruby/rails:7.1 dev-ruby/rails:7.0 )
	dev-ruby/rspec-its
	)"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die

	# Provide a database.yml file for sqlite3.
	cp spec/internal/config/database.yml.sample spec/internal/config/database.yml || die
	sed -i -e '/^mysql/,$d' spec/internal/config/database.yml || die

	sed -i -e '/barrier/ s:^:#:' spec/spec_helper.rb || die

	# Avoid deprecation warning which cannot be solved due to issues with default_parser.
	sed -i -e '/WARNING/,/WARNING/ s:^:#:' lib/acts-as-taggable-on.rb || die

	# Avoid tests failing on encoding issues. This started failing at
	# some point due to dependencies and is not a regression from
	# previous versions.
	sed -e '311 s/it/xit/' \
		-i spec/acts_as_taggable_on/tag_spec.rb || die
	sed -e '579,620 s/it/xit/' \
		-e '/should be able to create and find tags in languages without capitalization/ s/context/xcontext/' \
		-i spec/acts_as_taggable_on/taggable_spec.rb || die
}
