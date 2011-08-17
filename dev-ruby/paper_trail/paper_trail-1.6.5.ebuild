# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb generators"

inherit ruby-fakegem

DESCRIPTION="PaperTrail lets you track changes to your models' data."
HOMEPAGE="https://github.com/airblade/paper_trail"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

# Broken with Rails 3 installed.
#RESTRICT="test"

ruby_add_rdepend "dev-ruby/activerecord:2.3 dev-ruby/actionpack:2.3"
