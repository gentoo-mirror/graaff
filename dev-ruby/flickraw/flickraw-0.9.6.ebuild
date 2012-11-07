# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A library to access flickr api in a simple way."
HOMEPAGE="http://github.com/hanklords/flickraw"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="doc"

# Tests are against the Flickr API and require an API key.
RESTRICT="test"
