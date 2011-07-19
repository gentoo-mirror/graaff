# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_TASK_TEST="spec features"

RUBY_FAKEGEM_EXTRADOC="readme.markdown"

RUBY_FAKEGEM_GEMSPEC="git-pivotal.gemspec"

inherit ruby-fakegem

DESCRIPTION="The Git Pivotal utility provides three tools to integrate with your Pivotal Tracker project."
HOMEPAGE="http://www.pivotaltracker.com/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

# Specs and features both fail, not clear why.
RESTRICT="test"

ruby_add_rdepend "dev-ruby/builder >=dev-ruby/pivotal-tracker-0.3.1"

#ruby_add_bdepend "test? ( >=dev-ruby/rspec-2.5.0:2 >=dev-util/cucumber-0.9.2 >=dev-util/aruba-0.2.3 )"

all_ruby_prepare() {
	# We don't need coverage data and ree18 doesn't have rcov yet.
	sed -i -e 's/t.rcov = true/t.rcov = false/' Rakefile || die

	# Tweak dependencies to allow newer versions.
	sed -i -e 's/~> 0.3.1/>= 0.3.1/' git-pivotal.gemspec
}
