# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Runs passenger-status to graph CPU, RAM, queue size, requests served, etc."
HOMEPAGE="https://github.com/pjungwir/munin_passenger"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

# Wants to run passenger-status which requires root rights.
RESTRICT="test"

ruby_add_rdepend "
	dev-ruby/json
	dev-ruby/nokogiri
"
