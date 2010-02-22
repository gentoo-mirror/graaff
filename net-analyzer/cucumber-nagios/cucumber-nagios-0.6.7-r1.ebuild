# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/mislav-will_paginate/mislav-will_paginate-2.3.11.ebuild,v 1.1 2009/06/08 20:44:54 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST="cucumber"

inherit ruby-fakegem

DESCRIPTION="cucumber-nagios allows you to write high-level behavioural tests of web application, and plug the results into Nagios."
HOMEPAGE="http://auxesis.github.com/cucumber-nagios/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests are broken: they seem to require a .gemspec file that isn't present.
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/templater-0.5
	>=dev-ruby/rake-0.8.3
	>=dev-ruby/bundler-0.6.0"

each_ruby_install() {
	each_fakegem_install

	fperms 755 $(ruby_fakegem_gemsdir)/gems/${RUBY_FAKEGEM_NAME}-${RUBY_FAKEGEM_VERSION}/lib/generators/project/bin/*
}
