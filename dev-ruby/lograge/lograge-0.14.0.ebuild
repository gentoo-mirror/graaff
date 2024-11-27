# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="lograge.gemspec"

inherit ruby-fakegem

DESCRIPTION="Tame Rails' multi-line logging into a single line per request"
HOMEPAGE="https://github.com/roidrage/lograge"
SRC_URI="https://github.com/roidrage/lograge/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64"

ruby_add_rdepend "
	>=dev-ruby/actionpack-4
	>=dev-ruby/activesupport-4
	>=dev-ruby/railties-4
	dev-ruby/request_store:0
"

all_ruby_prepare() {
	sed -e 's/git ls-files/find/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die

	# Avoid specs for unpackaged gems
	rm -f spec/formatters/{lines,logstash}_spec.rb || die
}
