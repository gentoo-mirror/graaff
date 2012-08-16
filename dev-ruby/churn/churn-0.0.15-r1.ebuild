# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_GEMSPEC="churn.gemspec"

inherit ruby-fakegem

DESCRIPTION="A Project to give the churn file, class, and method for a project for a given checkin."
HOMEPAGE="http://metric-fu.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend ">=dev-ruby/mocha-0.9.5
	dev-ruby/test-construct
	dev-ruby/shoulda"

ruby_add_rdepend "dev-ruby/main
	dev-ruby/json
	dev-ruby/chronic
	dev-ruby/sexp_processor
	dev-ruby/ruby_parser
	dev-ruby/hirb"

all_ruby_prepare() {
	sed -i -e '/check_dependencies/d' Rakefile || die "Unable to remove check_dependencies dependency."
	# We only package json, not json_pure.
	sed -i -e 's/json_pure/json/' churn.gemspec || die
	# jeweler is not a runtime dependency.
	sed -i -e '/jeweler/d' churn.gemspec || die
}

all_ruby_install() {
	all_fakegem_install

	doman man/churn.1
}
