# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

# Tests fail, skipping for now.
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Parse with Ripper, produce sexps that are compatible with RubyParser."
HOMEPAGE="http://www.github.com/mvz/ripper_ruby_parser"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend "=dev-ruby/sexp_processor-3*"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-3.0.1 )"

#   ruby_parser (~> 2.3.1, development)
#   simplecov (>= 0, development)
