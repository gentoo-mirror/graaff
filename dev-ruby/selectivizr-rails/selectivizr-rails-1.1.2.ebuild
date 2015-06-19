# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="readme.md"

RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="Include the Selectivizr.js library into your Rails 3.1 or higher app."
HOMEPAGE="https://github.com/jhubert/selectivizr-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
