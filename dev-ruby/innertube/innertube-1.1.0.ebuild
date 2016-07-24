# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="A thread-safe resource pool, originally borne in riak-client (Ripple)"
HOMEPAGE="http://github.com/basho/innertube"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""
