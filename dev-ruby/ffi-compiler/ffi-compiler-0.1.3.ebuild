# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Ruby FFI Rakefile generator"
HOMEPAGE="http://wiki.github.com/ffi/ffi"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rake >=dev-ruby/ffi-1.0.0"
