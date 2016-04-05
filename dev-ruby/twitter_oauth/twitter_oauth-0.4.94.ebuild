# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI=4
USE_RUBY="ruby18 ruby19"

# Not distributed in the gem.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.textile"

inherit ruby-fakegem

DESCRIPTION="Twitter OAuth REST API client library for Ruby"
HOMEPAGE="https://github.com/moomerman/twitter_oauth"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oauth-0.4.1
	>=dev-ruby/json-1.1.9
	>=dev-ruby/mime-types-1.16"
