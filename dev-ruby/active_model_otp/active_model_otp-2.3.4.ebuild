# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Adds methods to set and authenticate against one time passwords"
HOMEPAGE="https://github.com/heapsource/active_model_otp"
SRC_URI="https://github.com/heapsource/active_model_otp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64"

ruby_add_rdepend "
	dev-ruby/activemodel:*
	=dev-ruby/rotp-6.3*
"
