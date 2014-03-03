# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="integrates with bundler and rake to test your library against different versions of dependencies"
HOMEPAGE="http://github.com/thoughtbot/appraisal"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	dev-ruby/rake
	dev-ruby/bundler
"

all_ruby_prepare() {
	sed -i -e 's/~> 0.4.2/>= 0.4.2/' appraisal.gemspec || die
}
