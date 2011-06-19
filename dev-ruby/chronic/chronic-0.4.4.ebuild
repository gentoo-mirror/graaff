# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="HISTORY.md README.md"

inherit ruby-fakegem

DESCRIPTION="Chronic is a natural language date/time parser written in pure Ruby."
HOMEPAGE="https://github.com/mojombo/chronic"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
