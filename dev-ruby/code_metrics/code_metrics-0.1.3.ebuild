# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Extraction of the rails rake stats task as a gem and rails plugin"
HOMEPAGE="https://github.com/bf4/code_metrics"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE=""

# Gem does not contain all files needed for tests.
RESTRICT=test

ruby_add_rdepend ">dev-ruby/rails-3.0 <dev-ruby/rails-5.0"
