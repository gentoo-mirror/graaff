# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="test collection using each or other enumerable methods"
HOMEPAGE="https://github.com/gregwebs/rspec-multi-matchers"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

all_ruby_prepare() {
	# Fails on whitespace differences with newer rspec.
	rm spec/lib/match_each_spec.rb || die
}
