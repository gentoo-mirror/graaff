# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="a template language whose goal is reduce the syntax to the essential parts without becoming cryptic"
HOMEPAGE="http://slim-lang.com/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/temple-0.6.5 =dev-ruby/temple-0.6*"

ruby_add_bdepend "doc? ( dev-ruby/yard dev-ruby/redcarpet )"

all_ruby_prepare() {
	# This sinatra code expects tests to be installed but we strip those.
	sed -i -e "s/require 'sinatra'/require 'bogussinatra'/" Rakefile || die

	# Avoid tests for things we don't have.
	sed -i -e '/test_wip_render_with_asciidoc/,/^  end/ s:^:#:' \
		-e '/test_render_with_wiki/,/^  end/ s:^:#:' \
		-e '/test_render_with_creole/,/^  end/ s:^:#:' test/core/test_embedded_engines.rb || die
}
