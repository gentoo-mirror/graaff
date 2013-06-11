# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC=""

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRAINSTALL="build examples ext man"

inherit ruby-fakegem

DESCRIPTION="an intelligent preloader for ruby applications"
HOMEPAGE="http://zeus.is/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RESTRICT="test" # tests fail, not reported upstream yet.

ruby_add_rdepend ">=dev-ruby/method_source-0.6.7"

all_ruby_prepare() {
	# Don't force specific CXXFLAGS.
	sed -i -e '/^CXX/d' ext/inotify-wrapper/extconf.rb || die
	sed -i -e '/-c/! s/CXXFLAGS/LDFLAGS/' ext/inotify-wrapper/extconf.rb || die

	# Needs to be present for specs.
	touch Gemfile.lock
}

each_ruby_configure() {
	${RUBY} -Cext/inotify-wrapper extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/inotify-wrapper
}

each_ruby_test() {
	PATH="${S}/bin":$PATH ${RUBY} -S rspec spec || die
}
