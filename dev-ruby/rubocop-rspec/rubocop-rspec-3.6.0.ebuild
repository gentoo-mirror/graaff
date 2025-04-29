# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRAINSTALL="config"

RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="rubocop-rspec.gemspec"

inherit ruby-fakegem

DESCRIPTION="Code style checking for RSpec files"
HOMEPAGE="https://github.com/rubocop/rubocop-rspec"
SRC_URI="https://github.com/rubocop/rubocop-rspec/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	>=dev-ruby/lint_roller-1.1:1
	=dev-ruby/rubocop-1* >=dev-ruby/rubocop-1.72.1
"

ruby_add_depend "test? ( dev-ruby/bundler dev-ruby/rspec:3 dev-ruby/yard )"

all_ruby_prepare() {
	# Avoid test making unwarrented assumptions about the current
	# directory.
	#sed -e '/puts the configuration path/ s/it/xit/' \
		#		-i spec/rubocop/rspec/inject_spec.rb || die

	sed -e '/\(bump\|rubocop\|simplecov\)/ s:^:#:' \
		-i Gemfile || die
	rm -f tasks/cut_release.rake || die
	sed -e '/simplecov/ s:^:#:' \
		-i spec/spec_helper.rb || die
	sed -e '/format/d' \
		-i .rspec || die
}
