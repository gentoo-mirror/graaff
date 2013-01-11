# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR=""
RUBY_FAKEGEM_EXTRADOC="DESIGN.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="This is a simple command line tool to analyze request log files."
HOMEPAGE="http://github.com/wvanbergen/request-log-analyzer/wiki"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

all_ruby_prepare() {
	rm Gemfile || die
}
