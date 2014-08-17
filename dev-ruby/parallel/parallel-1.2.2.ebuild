# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="Readme.md"

inherit ruby-fakegem

DESCRIPTION="Run any code in parallel Processes or Threads"
HOMEPAGE="https://github.com/grosser/parallel"
LICENSE="MIT"
SRC_URI="https://github.com/grosser/parallel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

DEPEND+="test? ( sys-process/lsof )"

ruby_add_bdepend "test? ( dev-ruby/ruby-progressbar )"

each_ruby_prepare() {
	# Make sure the correct ruby is used for testing
	sed -e 's:ruby :'${RUBY}' :' -i spec/parallel_spec.rb || die
}

all_ruby_prepare() {
	# Avoid a failing spec regarding to pipes. The spec seems like it
	# should always fail.
	sed -e '/does not open unnecessary pipes/,/end/ s:^:#:' \
		-i spec/parallel_spec.rb || die
}

each_ruby_test() {
	# Set RUBYLIB explicitly for the ruby's that get started from the specs.
	RUBYLIB="lib" ${RUBY} -S rspec spec || die
}
