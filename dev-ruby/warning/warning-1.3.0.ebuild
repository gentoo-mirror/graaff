# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31 ruby32"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"
RUBY_FAKEGEM_GEMSPEC="warning.gemspec"

inherit ruby-fakegem

DESCRIPTION="Custom processing for warnings"

HOMEPAGE="https://github.com/jeremyevans/ruby-warning"
SRC_URI="https://github.com/jeremyevans/ruby-warning/archive/${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="ruby-${P}"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest-global_expectations )"
