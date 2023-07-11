# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGES README.md"

inherit ruby-fakegem

DESCRIPTION="HTTP Accept, Accept-Charset, Accept-Encoding, and Accept-Language for Ruby/Rack"
HOMEPAGE="https://github.com/mjackson/rack-accept"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/rack-0.4:*
"
