# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rake/rake-0.8.7-r2.ebuild,v 1.2 2009/12/15 06:54:12 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

DESCRIPTION="Construct is extensible, persistent, structured configuration for Ruby and humans with text editors."
HOMEPAGE="http://github.com/aphyr/construct"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
