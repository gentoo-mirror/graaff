# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ree18"

inherit ruby-fakegem

# There are tests but they don't work with rails 3 installed.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

DESCRIPTION="This library adds simple versioning to an ActiveRecord module."
HOMEPAGE="http://rubyforge.org/projects/ar-versioned"
SRC_URI="https://github.com/technoweenie/acts_as_versioned/tarball/rails_2 -> ${P}.tgz"
RUBY_S="technoweenie-acts_as_versioned-*"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "dev-ruby/activerecord:2.3"
